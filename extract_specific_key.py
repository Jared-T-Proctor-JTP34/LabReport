#!/usr/bin/env python3
"""
Extract private key for the specific key ID: 087526c4e652380e51c861225f3af762f62d4310
"""

import json
import os

def extract_specific_key():
    """Extract the private key for the specific key ID"""
    
    print("🔍 Looking for key ID: 087526c4e652380e51c861225f3af762f62d4310")
    print("=" * 60)
    
    # Check possible filenames
    possible_files = [
        'new-service-account-key.json',
        'service-account-key.json',
        'lap-reports-*.json'
    ]
    
    for filename in possible_files:
        if os.path.exists(filename):
            try:
                with open(filename, 'r') as f:
                    data = json.load(f)
                
                key_id = data.get('private_key_id')
                private_key = data.get('private_key')
                
                print(f"📁 Checking file: {filename}")
                print(f"🔑 Key ID found: {key_id}")
                
                if key_id == '087526c4e652380e51c861225f3af762f62d4310':
                    print("✅ MATCH! This is the correct key")
                    print("\n📋 Environment Variables:")
                    print("=" * 40)
                    print(f"GOOGLE_PRIVATE_KEY_ID={key_id}")
                    print(f"GOOGLE_PRIVATE_KEY={private_key}")
                    return True
                else:
                    print("❌ Key ID doesn't match")
                    
            except Exception as e:
                print(f"❌ Error reading {filename}: {e}")
        else:
            print(f"📁 File not found: {filename}")
    
    print("\n⚠️ Key with ID 087526c4e652380e51c861225f3af762f62d4310 not found")
    print("💡 Please download the correct key from Google Cloud Console")
    return False

if __name__ == '__main__':
    extract_specific_key()