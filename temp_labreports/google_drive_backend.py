#!/usr/bin/env python3
"""
Google Drive Backend Service
Handles all Google Drive operations without user authentication
"""

import os
import json
import base64
from datetime import datetime
from http.server import HTTPServer, BaseHTTPRequestHandler
from urllib.parse import urlparse, parse_qs
import requests
import tempfile

class GoogleDriveBackend:
    def __init__(self):
        # Your existing configuration
        self.api_key = 'AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk'
        self.folder_id = '1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc'
        
        # For service account (more secure backend approach)
        # You would replace this with a service account key file
        self.service_account_key = None
        
    def upload_file(self, file_content, filename, content_type='application/pdf'):
        """
        Upload file to Google Drive using API key (read-only access)
        For write access, we need service account or OAuth
        """
        try:
            # For now, we'll simulate the upload and save locally
            # In production, you'd use service account credentials
            
            # Create uploads directory if it doesn't exist
            uploads_dir = 'uploads'
            if not os.path.exists(uploads_dir):
                os.makedirs(uploads_dir)
            
            # Save file locally as backup
            filepath = os.path.join(uploads_dir, filename)
            
            if isinstance(file_content, str):
                with open(filepath, 'w', encoding='utf-8') as f:
                    f.write(file_content)
            else:
                with open(filepath, 'wb') as f:
                    f.write(file_content)
            
            print(f"✅ File saved locally: {filepath}")
            
            # TODO: Implement actual Google Drive upload with service account
            # This would require setting up a service account in Google Cloud Console
            
            return {
                'success': True,
                'file_id': f'local_{datetime.now().timestamp()}',
                'name': filename,
                'message': 'File saved locally (Google Drive upload requires service account setup)'
            }
            
        except Exception as e:
            print(f"❌ Upload failed: {e}")
            return {
                'success': False,
                'error': str(e)
            }

class BackendHandler(BaseHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        self.drive_backend = GoogleDriveBackend()
        super().__init__(*args, **kwargs)
    
    def do_OPTIONS(self):
        """Handle CORS preflight requests"""
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        self.end_headers()
    
    def do_POST(self):
        """Handle file upload requests"""
        if self.path == '/upload':
            try:
                # Get content length
                content_length = int(self.headers['Content-Length'])
                
                # Read the request body
                post_data = self.rfile.read(content_length)
                
                # Parse JSON data
                data = json.loads(post_data.decode('utf-8'))
                
                filename = data.get('filename', f'report_{datetime.now().strftime("%Y%m%d_%H%M%S")}.pdf')
                file_content = data.get('content', '')
                content_type = data.get('content_type', 'application/pdf')
                
                # Handle base64 encoded content (for PDFs)
                if data.get('encoding') == 'base64':
                    file_content = base64.b64decode(file_content)
                
                # Upload file
                result = self.drive_backend.upload_file(file_content, filename, content_type)
                
                # Send response
                self.send_response(200 if result['success'] else 500)
                self.send_header('Content-Type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.end_headers()
                
                response = json.dumps(result)
                self.wfile.write(response.encode('utf-8'))
                
            except Exception as e:
                self.send_response(500)
                self.send_header('Content-Type', 'application/json')
                self.send_header('Access-Control-Allow-Origin', '*')
                self.end_headers()
                
                error_response = json.dumps({
                    'success': False,
                    'error': str(e)
                })
                self.wfile.write(error_response.encode('utf-8'))
        else:
            self.send_response(404)
            self.end_headers()
    
    def do_GET(self):
        """Handle status requests"""
        if self.path == '/status':
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Access-Control-Allow-Origin', '*')
            self.end_headers()
            
            status = {
                'status': 'running',
                'google_drive_folder': self.drive_backend.folder_id,
                'timestamp': datetime.now().isoformat()
            }
            
            response = json.dumps(status)
            self.wfile.write(response.encode('utf-8'))
        else:
            self.send_response(404)
            self.end_headers()
    
    def log_message(self, format, *args):
        """Custom logging"""
        print(f"[{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}] {format % args}")

def start_backend_server(port=8001):
    """Start the backend server"""
    server_address = ('localhost', port)
    httpd = HTTPServer(server_address, BackendHandler)
    
    print(f"🚀 Google Drive Backend Server started at http://localhost:{port}")
    print(f"📁 Upload endpoint: http://localhost:{port}/upload")
    print(f"📊 Status endpoint: http://localhost:{port}/status")
    print(f"⏹️  Press Ctrl+C to stop the server")
    print()
    
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n⏹️  Server stopped by user")
        httpd.server_close()

if __name__ == "__main__":
    start_backend_server()