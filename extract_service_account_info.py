#!/usr/bin/env python3
"""
Extract Google Service Account information for Render environment variables
"""

import json
import os

def extract_service_account_info():
    """Extract key information from service-account-key.json"""
    
    service_account_file = 'service-account-key.json'
    
    print("🔍 Extracting Service Account Information")
    print("=" * 50)
    
    if not os.path.exists(service_account_file):
        print(f"❌ File not found: {service_account_file}")
        print("📋 Please ensure the service account JSON file is in this directory")
        return
    
    try:
        with open(service_account_file, 'r') as f:
            service_account_data = json.load(f)
        
        print("✅ Service account file found and loaded")
        print()
        
        # Extract required fields
        required_fields = {
            'GOOGLE_PROJECT_ID': service_account_data.get('project_id'),
            'GOOGLE_CLIENT_EMAIL': service_account_data.get('client_email'),
            'GOOGLE_CLIENT_ID': service_account_data.get('client_id'),
            'GOOGLE_PRIVATE_KEY_ID': service_account_data.get('private_key_id'),
            'GOOGLE_PRIVATE_KEY': service_account_data.get('private_key')
        }
        
        print("📋 Environment Variables for Render:")
        print("=" * 50)
        
        for key, value in required_fields.items():
            if value:
                if key == 'GOOGLE_PRIVATE_KEY':
                    # Show first and last few characters of private key for security
                    display_value = f"{value[:50]}...{value[-50:]}" if len(value) > 100 else value
                    print(f"{key}={display_value}")
                    print(f"   (Full key length: {len(value)} characters)")
                else:
                    print(f"{key}={value}")
            else:
                print(f"{key}=❌ NOT FOUND")
        
        print("\n" + "=" * 50)
        print("📋 Copy these to Render Environment Variables:")
        print("=" * 50)
        
        # Show copyable format
        for key, value in required_fields.items():
            if value and key != 'GOOGLE_PRIVATE_KEY':
                print(f"{key}={value}")
        
        # Handle private key specially
        if required_fields['GOOGLE_PRIVATE_KEY']:
            print(f"GOOGLE_PRIVATE_KEY={required_fields['GOOGLE_PRIVATE_KEY']}")
        
        print("\n💡 Instructions:")
        print("1. Go to https://render.com/dashboard")
        print("2. Click on your service: labreport-q96c")
        print("3. Go to 'Environment' tab")
        print("4. Add each variable above")
        print("5. Service will automatically redeploy")
        
        print("\n⚠️ Security Note:")
        print("- Keep your private key secure")
        print("- Don't share it publicly")
        print("- Only add it to Render's secure environment variables")
        
    except json.JSONDecodeError as e:
        print(f"❌ Invalid JSON in service account file: {e}")
    except Exception as e:
        print(f"❌ Error reading service account file: {e}")

if __name__ == '__main__':
    extract_service_account_info()