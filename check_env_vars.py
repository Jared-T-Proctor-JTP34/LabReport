#!/usr/bin/env python3
"""
Check what environment variables are available in your backend
"""

import requests
import json

def check_backend_env():
    """Check backend environment variables"""
    
    url = 'https://labreport-q96c.onrender.com/status'
    
    print("🔍 Checking Backend Environment Variables")
    print("=" * 50)
    
    try:
        response = requests.get(url, timeout=10)
        
        if response.status_code == 200:
            data = response.json()
            
            print("✅ Backend Status:", data.get('status', 'Unknown'))
            print("🔧 Service:", data.get('service', 'Unknown'))
            print("🌐 Environment:", data.get('environment', 'Unknown'))
            
            # Check if Google Drive is ready
            drive_ready = data.get('drive_service_ready', False)
            print(f"📁 Google Drive Ready: {'✅ Yes' if drive_ready else '❌ No'}")
            
            if not drive_ready:
                print("\n⚠️ Google Drive not configured. Missing environment variables:")
                print("   - GOOGLE_PRIVATE_KEY")
                print("   - GOOGLE_PRIVATE_KEY_ID") 
                print("   - GOOGLE_CLIENT_EMAIL")
                
            print(f"\n📋 Full Response:")
            print(json.dumps(data, indent=2))
            
        else:
            print(f"❌ Error: {response.status_code}")
            print(f"Response: {response.text}")
            
    except Exception as e:
        print(f"❌ Failed to connect: {e}")

def show_required_env_vars():
    """Show what environment variables should be set"""
    
    print("\n" + "=" * 50)
    print("📋 Required Environment Variables for Google Drive")
    print("=" * 50)
    
    required_vars = {
        "TARGET_EMAIL": "labreporting1177@gmail.com",
        "TARGET_FOLDER_ID": "1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc", 
        "SERVICE_ACCOUNT_EMAIL": "pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com",
        "GOOGLE_PROJECT_ID": "lap-reports",
        "GOOGLE_CLIENT_ID": "113380403214174229428",
        "GOOGLE_CLIENT_EMAIL": "pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com",
        "GOOGLE_PRIVATE_KEY": "(from your service-account-key.json file)",
        "GOOGLE_PRIVATE_KEY_ID": "(from your service-account-key.json file)"
    }
    
    for key, value in required_vars.items():
        print(f"{key}={value}")
    
    print("\n💡 To add these:")
    print("1. Go to https://render.com/dashboard")
    print("2. Click on your service: labreport-q96c")
    print("3. Go to 'Environment' tab")
    print("4. Add missing variables")
    print("5. Service will automatically redeploy")

if __name__ == '__main__':
    check_backend_env()
    show_required_env_vars()