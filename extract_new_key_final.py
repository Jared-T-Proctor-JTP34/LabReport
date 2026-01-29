#!/usr/bin/env python3
"""
Extract the new service account key information
"""

import json
import os

def extract_new_key():
    """Extract from new-service-account-key.json"""
    
    filename = 'new-service-account-key.json'
    
    print(f"🔍 Extracting from: {filename}")
    print("=" * 50)
    
    if not os.path.exists(filename):
        print(f"❌ File not found: {filename}")
        return
    
    try:
        with open(filename, 'r') as f:
            data = json.load(f)
        
        key_id = data.get('private_key_id')
        private_key = data.get('private_key')
        client_email = data.get('client_email')
        project_id = data.get('project_id')
        
        print("✅ New service account key loaded")
        print(f"🔑 Key ID: {key_id}")
        print(f"📧 Client Email: {client_email}")
        print(f"📋 Project ID: {project_id}")
        print()
        
        print("📋 Environment Variables for Render:")
        print("=" * 50)
        print(f"GOOGLE_PRIVATE_KEY_ID={key_id}")
        print(f"GOOGLE_PRIVATE_KEY={private_key}")
        
        print("\n🔧 Complete Environment Variables List:")
        print("=" * 50)
        print("TARGET_EMAIL=labreporting1177@gmail.com")
        print("TARGET_FOLDER_ID=1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc")
        print("SERVICE_ACCOUNT_EMAIL=pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com")
        print(f"GOOGLE_PROJECT_ID={project_id}")
        print("GOOGLE_CLIENT_ID=113380403214174229428")
        print(f"GOOGLE_CLIENT_EMAIL={client_email}")
        print(f"GOOGLE_PRIVATE_KEY_ID={key_id}")
        print(f"GOOGLE_PRIVATE_KEY={private_key}")
        
        print("\n💡 Add these to Render Environment Variables")
        
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == '__main__':
    extract_new_key()