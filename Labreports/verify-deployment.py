#!/usr/bin/env python3
"""
Verify GitHub repository deployment and application functionality
"""

import requests
import os
from datetime import datetime

def check_github_pages():
    """Check if GitHub Pages is working"""
    print("🌐 Testing GitHub Pages deployment...")
    
    urls_to_test = [
        "https://jared-t-proctor-jtp34.github.io/LabReport/",
        "https://labreporttool.xyz"
    ]
    
    for url in urls_to_test:
        try:
            response = requests.get(url, timeout=10)
            if response.status_code == 200:
                print(f"✅ {url} - Status: {response.status_code}")
                if "Pharmacy Compounding Compliance Log" in response.text:
                    print(f"   📋 Application content detected")
                else:
                    print(f"   ⚠️  Content may not be fully loaded")
            else:
                print(f"❌ {url} - Status: {response.status_code}")
        except Exception as e:
            print(f"❌ {url} - Error: {e}")

def check_local_files():
    """Check if all required files are present"""
    print("\n📁 Checking local file structure...")
    
    required_files = [
        "Pharmacy_Compliance_Backend.html",
        "index.html",
        "google_drive_backend.py",
        "test_backend.py",
        "README.md",
        "CNAME"
    ]
    
    missing_files = []
    for file in required_files:
        if os.path.exists(file):
            print(f"✅ {file}")
        else:
            print(f"❌ {file} - MISSING")
            missing_files.append(file)
    
    if missing_files:
        print(f"\n⚠️  Missing files: {', '.join(missing_files)}")
        return False
    else:
        print(f"\n✅ All required files present")
        return True

def check_backend_service():
    """Check if backend service can start"""
    print("\n🔧 Testing backend service availability...")
    
    try:
        # Try to connect to backend (if running)
        response = requests.get("http://localhost:8001/status", timeout=2)
        if response.status_code == 200:
            status = response.json()
            print(f"✅ Backend service is running")
            print(f"   Status: {status.get('status')}")
            print(f"   Folder: {status.get('google_drive_folder')}")
            return True
    except:
        print(f"⚠️  Backend service not running (this is normal)")
        print(f"   To start: python3 google_drive_backend.py")
        return False

def check_html_validity():
    """Basic check of HTML file structure"""
    print("\n📄 Checking HTML application structure...")
    
    try:
        with open("Pharmacy_Compliance_Backend.html", 'r', encoding='utf-8') as f:
            content = f.read()
            
        checks = [
            ("DOCTYPE declaration", "<!DOCTYPE html>" in content),
            ("Title tag", "<title>" in content),
            ("jsPDF library", "jspdf" in content.lower()),
            ("Login system", "loginScreen" in content),
            ("Status symbol", "statusSymbol" in content),
            ("USP areas", "non-sterile" in content and "sterile" in content and "hazardous" in content),
            ("Backend config", "BACKEND_URL" in content),
        ]
        
        all_passed = True
        for check_name, passed in checks:
            if passed:
                print(f"✅ {check_name}")
            else:
                print(f"❌ {check_name}")
                all_passed = False
        
        return all_passed
        
    except Exception as e:
        print(f"❌ Error reading HTML file: {e}")
        return False

def main():
    """Run all deployment verification checks"""
    print("🚀 GitHub Repository & Application Verification")
    print("=" * 50)
    
    # Check local files
    files_ok = check_local_files()
    
    # Check HTML structure
    html_ok = check_html_validity()
    
    # Check backend service
    backend_running = check_backend_service()
    
    # Check GitHub Pages deployment
    check_github_pages()
    
    # Summary
    print("\n" + "=" * 50)
    print("📊 VERIFICATION SUMMARY")
    print("=" * 50)
    
    print(f"📁 Local Files: {'✅ PASS' if files_ok else '❌ FAIL'}")
    print(f"📄 HTML Structure: {'✅ PASS' if html_ok else '❌ FAIL'}")
    print(f"🔧 Backend Service: {'✅ RUNNING' if backend_running else '⚠️  OFFLINE'}")
    print(f"🌐 GitHub Pages: Check results above")
    
    if files_ok and html_ok:
        print(f"\n🎉 APPLICATION STATUS: READY FOR DEPLOYMENT")
        print(f"📋 Next Steps:")
        print(f"   1. Commit changes to GitHub")
        print(f"   2. Verify GitHub Pages deployment")
        print(f"   3. Test live application at labreporttool.xyz")
        print(f"   4. Start backend service for full functionality")
    else:
        print(f"\n⚠️  APPLICATION STATUS: NEEDS ATTENTION")
        print(f"   Please fix the issues listed above")
    
    print(f"\n🔗 Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport")
    print(f"🌐 Live Site: https://labreporttool.xyz")

if __name__ == "__main__":
    main()