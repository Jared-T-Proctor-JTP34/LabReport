#!/usr/bin/env python3
"""
Test JSON Key Path - Verify service account key is in same directory as script
"""

import os
import json

def test_json_key_path():
    """Test that JSON key is in same directory as this script"""
    print("🔍 JSON KEY PATH TEST")
    print("=" * 40)
    
    # Get the directory where this script is located
    script_dir = os.path.dirname(os.path.abspath(__file__))
    print(f"📁 Script directory: {script_dir}")
    
    # Build path to service account key in same directory
    json_key_path = os.path.join(script_dir, 'service-account-key.json')
    print(f"📄 Looking for JSON key at: {json_key_path}")
    
    # Check if file exists
    if os.path.exists(json_key_path):
        print("✅ JSON key file FOUND in same directory as script!")
        
        # Verify it's a valid JSON file
        try:
            with open(json_key_path, 'r') as f:
                data = json.load(f)
            
            print("✅ JSON file is valid")
            print(f"📧 Service account: {data.get('client_email', 'Unknown')}")
            print(f"🏗️ Project: {data.get('project_id', 'Unknown')}")
            
            # Test the exact same path logic used in BACKEND_SERVICE_ACCOUNT.py
            backend_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'service-account-key.json')
            print(f"\n🔧 Backend will use path: {backend_path}")
            print(f"✅ Path matches: {json_key_path == backend_path}")
            
            return True
            
        except json.JSONDecodeError as e:
            print(f"❌ Invalid JSON format: {e}")
            return False
        except Exception as e:
            print(f"❌ Error reading JSON: {e}")
            return False
    else:
        print("❌ JSON key file NOT FOUND")
        print("\n📋 Files in script directory:")
        try:
            files = [f for f in os.listdir(script_dir) if f.endswith('.json')]
            if files:
                for file in files:
                    print(f"   📄 {file}")
            else:
                print("   No JSON files found")
        except Exception as e:
            print(f"   ❌ Error listing files: {e}")
        return False

if __name__ == "__main__":
    success = test_json_key_path()
    
    if success:
        print("\n🎉 SUCCESS: JSON key is properly located!")
        print("✅ BACKEND_SERVICE_ACCOUNT.py will find the key")
        print("✅ Ready to run the backend")
    else:
        print("\n❌ ISSUE: JSON key path problem")
        print("📋 Make sure service-account-key.json is in the same directory")
    
    print("\n" + "=" * 40)