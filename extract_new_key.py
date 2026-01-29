#!/usr/bin/env python3
"""
Extract information from the current active service account key
"""

import json
import os

def extract_from_file(filename):
    """Extract key information from service account JSON file"""
    
    print(f"🔍 Extracting from: {filename}")
    print("=" * 50)
    
    if not os.path.exists(filename):
        print(f"❌ File not found: {filename}")
        return
    
    try:
        with open(filename, 'r') as f:
            data = json.load(f)
        
        print("✅ Service account file loaded")
        print()
        
        # Extract the key information
        key_id = data.get('private_key_id')
        private_key = data.get('private_key')
        
        print("📋 Environment Variables for Render:")
        print("=" * 50)
        print(f"GOOGLE_PRIVATE_KEY_ID={key_id}")
        print(f"GOOGLE_PRIVATE_KEY={private_key}")
        
        print("\n💡 Copy these values to your Render environment variables")
        
    except Exception as e:
        print(f"❌ Error: {e}")

def check_current_key():
    """Check if we can use the current service-account-key.json"""
    
    if os.path.exists('service-account-key.json'):
        print("🔍 Found existing service-account-key.json")
        extract_from_file('service-account-key.json')
    else:
        print("❌ No service-account-key.json found")
        print("📋 Please download the key from Google Cloud Console")

if __name__ == '__main__':
    print("🔑 Service Account Key Extractor")
    print("=" * 50)
    
    # Check for different possible filenames
    possible_files = [
        'service-account-key.json',
        'service-account-key-new.json',
        'lap-reports-*.json'
    ]
    
    found = False
    for filename in possible_files:
        if os.path.exists(filename):
            extract_from_file(filename)
            found = True
            break
    
    if not found:
        print("📋 No service account key file found")
        print("💡 Download the key from Google Cloud Console:")
        print("   1. Go to your service account page")
        print("   2. Click on the key with ID: 087526c4e652380e51c861225f3af762f62d4310")
        print("   3. Download as JSON")
        print("   4. Save in this directory")
        print("   5. Run this script again")