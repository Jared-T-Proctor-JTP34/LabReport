#!/usr/bin/env python3
"""
Google Drive Backend with Service Account Authentication
Automatic uploads for labreporting1177@gmail.com
"""

import os
import json
import base64
from datetime import datetime
from flask import Flask, request, jsonify
from flask_cors import CORS
from google.oauth2 import service_account
from googleapiclient.discovery import build
from googleapiclient.http import MediaIoBaseUpload
import io

app = Flask(__name__)
CORS(app)

# Configuration
CONFIG = {
    'TARGET_EMAIL': 'labreporting1177@gmail.com',
    'TARGET_FOLDER_ID': '1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc',
    'SERVICE_ACCOUNT_EMAIL': 'pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com',
    'SERVICE_ACCOUNT_FILE': 'service-account-key.json',
    'SCOPES': ['https://www.googleapis.com/auth/drive.file']
}

class GoogleDriveService:
    def __init__(self):
        self.service = None
        self.credentials = None
        self.initialize_service()
    
    def initialize_service(self):
        """Initialize Google Drive service with service account"""
        try:
            # Check if service account file exists
            if not os.path.exists(CONFIG['SERVICE_ACCOUNT_FILE']):
                print(f"❌ Service account file not found: {CONFIG['SERVICE_ACCOUNT_FILE']}")
                print("📋 Please follow these steps:")
                print("1. Create service account in Google Cloud Console")
                print("2. Download JSON key file")
                print("3. Rename to 'service-account-key.json'")
                print("4. Place in same directory as this script")
                return False
            
            # Load service account credentials
            self.credentials = service_account.Credentials.from_service_account_file(
                CONFIG['SERVICE_ACCOUNT_FILE'],
                scopes=CONFIG['SCOPES']
            )
            
            # Build Drive service
            self.service = build('drive', 'v3', credentials=self.credentials)
            
            print(f"✅ Google Drive service initialized")
            print(f"📧 Service account: {self.credentials.service_account_email}")
            
            # Test folder access
            self.test_folder_access()
            
            return True
            
        except Exception as e:
            print(f"❌ Failed to initialize Google Drive service: {e}")
            return False
    
    def test_folder_access(self):
        """Test access to target folder"""
        try:
            if not self.service:
                return False
                
            # Try to access the target folder
            folder = self.service.files().get(
                fileId=CONFIG['TARGET_FOLDER_ID'],
                fields='id,name,owners,permissions'
            ).execute()
            
            print(f"✅ Folder access confirmed: {folder.get('name')}")
            print(f"📁 Folder ID: {folder.get('id')}")
            
            # Check permissions
            permissions = self.service.permissions().list(
                fileId=CONFIG['TARGET_FOLDER_ID']
            ).execute()
            
            service_account_email = self.credentials.service_account_email
            has_permission = any(
                perm.get('emailAddress') == service_account_email 
                for perm in permissions.get('permissions', [])
            )
            
            if has_permission:
                print(f"✅ Service account has folder permissions")
            else:
                print(f"⚠️ Service account may not have folder permissions")
                print(f"📋 Share folder {CONFIG['TARGET_FOLDER_ID']} with: {service_account_email}")
            
            return True
            
        except Exception as e:
            print(f"❌ Folder access test failed: {e}")
            print(f"📋 Please share folder {CONFIG['TARGET_FOLDER_ID']} with service account")
            return False
    
    def upload_file(self, filename, content, content_type='application/pdf'):
        """Upload file to Google Drive"""
        try:
            if not self.service:
                raise Exception("Google Drive service not initialized")
            
            # Prepare file metadata
            file_metadata = {
                'name': filename,
                'parents': [CONFIG['TARGET_FOLDER_ID']]
            }
            
            # Handle different content types
            if isinstance(content, str):
                # Base64 encoded content
                file_content = base64.b64decode(content)
            elif isinstance(content, bytes):
                # Raw bytes
                file_content = content
            else:
                # Assume it's already a file-like object
                file_content = content
            
            # Create media upload
            media = MediaIoBaseUpload(
                io.BytesIO(file_content),
                mimetype=content_type,
                resumable=True
            )
            
            # Upload file
            file = self.service.files().create(
                body=file_metadata,
                media_body=media,
                fields='id,name,webViewLink'
            ).execute()
            
            print(f"✅ File uploaded successfully: {file.get('name')}")
            print(f"📁 File ID: {file.get('id')}")
            print(f"🔗 View link: {file.get('webViewLink')}")
            
            return {
                'success': True,
                'file_id': file.get('id'),
                'file_name': file.get('name'),
                'web_view_link': file.get('webViewLink'),
                'message': f'File uploaded to {CONFIG["TARGET_EMAIL"]} Google Drive'
            }
            
        except Exception as e:
            print(f"❌ Upload failed: {e}")
            return {
                'success': False,
                'error': str(e),
                'message': 'Upload to Google Drive failed'
            }

# Initialize Google Drive service
drive_service = GoogleDriveService()

@app.route('/status', methods=['GET'])
def status():
    """Check service status"""
    return jsonify({
        'status': 'running',
        'service': 'Google Drive Backend with Service Account',
        'target_email': CONFIG['TARGET_EMAIL'],
        'folder_id': CONFIG['TARGET_FOLDER_ID'],
        'drive_service_ready': drive_service.service is not None,
        'timestamp': datetime.now().isoformat()
    })

@app.route('/upload', methods=['POST'])
def upload_file():
    """Upload file to Google Drive"""
    try:
        data = request.get_json()
        
        if not data:
            return jsonify({'error': 'No data provided'}), 400
        
        filename = data.get('filename')
        content = data.get('content')
        content_type = data.get('content_type', 'application/pdf')
        encoding = data.get('encoding', 'text')
        
        if not filename or not content:
            return jsonify({'error': 'Missing filename or content'}), 400
        
        # Upload to Google Drive
        result = drive_service.upload_file(filename, content, content_type)
        
        if result['success']:
            # Also save local backup
            backup_dir = 'local_backups'
            os.makedirs(backup_dir, exist_ok=True)
            
            if encoding == 'base64':
                file_content = base64.b64decode(content)
            else:
                file_content = content.encode('utf-8')
            
            backup_path = os.path.join(backup_dir, filename)
            with open(backup_path, 'wb') as f:
                f.write(file_content)
            
            result['local_backup'] = backup_path
            return jsonify(result)
        else:
            return jsonify(result), 500
            
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e),
            'message': 'Upload processing failed'
        }), 500

@app.route('/test-upload', methods=['POST'])
def test_upload():
    """Test upload functionality"""
    try:
        # Create test file
        test_content = f"Test upload - {datetime.now().isoformat()}"
        test_filename = f"test-upload-{datetime.now().strftime('%Y%m%d-%H%M%S')}.txt"
        
        result = drive_service.upload_file(
            test_filename, 
            test_content.encode('utf-8'), 
            'text/plain'
        )
        
        return jsonify(result)
        
    except Exception as e:
        return jsonify({
            'success': False,
            'error': str(e),
            'message': 'Test upload failed'
        }), 500

@app.route('/setup-guide', methods=['GET'])
def setup_guide():
    """Return setup instructions"""
    guide = {
        'title': 'Service Account Setup Guide',
        'steps': [
            {
                'step': 1,
                'title': 'Create Service Account',
                'url': 'https://console.cloud.google.com/iam-admin/serviceaccounts',
                'instructions': [
                    'Click "Create Service Account"',
                    'Name: Pharmacy Compliance Reports',
                    'ID: pharmacy-compliance-reports',
                    'Description: Automated Google Drive uploads'
                ]
            },
            {
                'step': 2,
                'title': 'Generate JSON Key',
                'instructions': [
                    'Click on created service account',
                    'Go to "Keys" tab',
                    'Click "Add Key" → "Create new key"',
                    'Choose "JSON" format',
                    'Download and rename to "service-account-key.json"'
                ]
            },
            {
                'step': 3,
                'title': 'Share Google Drive Folder',
                'instructions': [
                    f'Open Google Drive with {CONFIG["TARGET_EMAIL"]}',
                    f'Navigate to folder ID: {CONFIG["TARGET_FOLDER_ID"]}',
                    'Right-click → Share',
                    'Add service account email (from JSON file)',
                    'Set permission to "Editor"'
                ]
            },
            {
                'step': 4,
                'title': 'Place JSON File',
                'instructions': [
                    'Place "service-account-key.json" in same directory as this script',
                    'Restart the backend service',
                    'Test upload functionality'
                ]
            }
        ],
        'current_status': {
            'service_account_file_exists': os.path.exists(CONFIG['SERVICE_ACCOUNT_FILE']),
            'drive_service_ready': drive_service.service is not None,
            'target_email': CONFIG['TARGET_EMAIL'],
            'target_folder': CONFIG['TARGET_FOLDER_ID']
        }
    }
    
    return jsonify(guide)

if __name__ == '__main__':
    print("🚀 Starting Google Drive Backend with Service Account")
    print(f"📧 Target email: {CONFIG['TARGET_EMAIL']}")
    print(f"📁 Target folder: {CONFIG['TARGET_FOLDER_ID']}")
    print(f"🔑 Service account file: {CONFIG['SERVICE_ACCOUNT_FILE']}")
    print("")
    
    if not drive_service.service:
        print("⚠️ Google Drive service not ready")
        print("📋 Visit http://localhost:8001/setup-guide for setup instructions")
    else:
        print("✅ Google Drive service ready for automatic uploads")
    
    print("")
    print("🌐 Backend running at: http://localhost:8001")
    print("📊 Status endpoint: http://localhost:8001/status")
    print("🧪 Test upload: http://localhost:8001/test-upload")
    
    app.run(host='0.0.0.0', port=8001, debug=True)