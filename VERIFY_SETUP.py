#!/usr/bin/env python3
"""
Quick Setup Verification Script
Checks if all components are ready for deployment
"""

import os
import json
import sys

def check_service_account_file():
    """Check if service account file exists and is valid"""
    print("🔍 Checking service account file...")
    
    if not os.path.exists('service-account-key.json'):
        print("❌ service-account-key.json not found")
        return False
    
    try:
        with open('service-account-key.json', 'r') as f:
            data = json.load(f)
        
        required_fields = ['type', 'project_id', 'private_key', 'client_email']
        for field in required_fields:
            if field not in data:
                print(f"❌ Missing field in JSON: {field}")
                return False
        
        print("✅ Service account file is valid")
        print(f"📧 Service account: {data['client_email']}")
        print(f"🏗️ Project: {data['project_id']}")
        return True
        
    except Exception as e:
        print(f"❌ Error reading service account file: {e}")
        return False

def check_backend_file():
    """Check if backend file exists"""
    print("\n🔍 Checking backend file...")
    
    if not os.path.exists('BACKEND_SERVICE_ACCOUNT.py'):
        print("❌ BACKEND_SERVICE_ACCOUNT.py not found")
        return False
    
    print("✅ Backend file found")
    return True

def check_requirements_file():
    """Check if requirements file exists"""
    print("\n🔍 Checking requirements file...")
    
    if not os.path.exists('requirements.txt'):
        print("❌ requirements.txt not found")
        return False
    
    try:
        with open('requirements.txt', 'r') as f:
            requirements = f.read()
        
        required_packages = ['flask', 'google-auth', 'google-api-python-client']
        missing = []
        
        for package in required_packages:
            if package not in requirements.lower():
                missing.append(package)
        
        if missing:
            print(f"❌ Missing packages in requirements.txt: {', '.join(missing)}")
            return False
        
        print("✅ Requirements file is complete")
        return True
        
    except Exception as e:
        print(f"❌ Error reading requirements.txt: {e}")
        return False

def check_render_config():
    """Check if render.yaml exists and is configured"""
    print("\n🔍 Checking Render configuration...")
    
    if not os.path.exists('render.yaml'):
        print("❌ render.yaml not found")
        return False
    
    try:
        with open('render.yaml', 'r') as f:
            content = f.read()
        
        if 'BACKEND_SERVICE_ACCOUNT.py' not in content:
            print("❌ render.yaml doesn't reference correct backend file")
            return False
        
        if 'requirements.txt' not in content:
            print("❌ render.yaml doesn't reference requirements.txt")
            return False
        
        print("✅ Render configuration looks good")
        return True
        
    except Exception as e:
        print(f"❌ Error reading render.yaml: {e}")
        return False

def main():
    """Run all verification checks"""
    print("=" * 50)
    print("🔧 SETUP VERIFICATION")
    print("=" * 50)
    
    checks = [
        check_service_account_file(),
        check_backend_file(),
        check_requirements_file(),
        check_render_config()
    ]
    
    passed = sum(checks)
    total = len(checks)
    
    print("\n" + "=" * 50)
    print("📊 VERIFICATION RESULTS")
    print("=" * 50)
    print(f"Passed: {passed}/{total} checks")
    
    if passed == total:
        print("\n🎉 All checks passed!")
        print("✅ Ready for local testing")
        print("✅ Ready for Render deployment")
        print("\n🚀 Next steps:")
        print("1. Run: python test_google_drive_connectivity.py")
        print("2. Run: python BACKEND_SERVICE_ACCOUNT.py")
        print("3. Test: http://localhost:8001/status")
        print("4. Deploy to Render")
        return True
    else:
        print("\n❌ Some checks failed")
        print("📋 Please fix the issues above")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)