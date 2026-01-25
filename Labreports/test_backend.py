#!/usr/bin/env python3
"""
Test the Google Drive backend service
"""

import requests
import json
import base64
from datetime import datetime

BACKEND_URL = 'http://localhost:8001'

def test_backend_status():
    """Test if backend service is running"""
    print("🧪 Testing backend service status...")
    try:
        response = requests.get(f'{BACKEND_URL}/status')
        if response.status_code == 200:
            status = response.json()
            print(f"✅ Backend service is running")
            print(f"   Status: {status.get('status')}")
            print(f"   Folder: {status.get('google_drive_folder')}")
            print(f"   Time: {status.get('timestamp')}")
            return True
        else:
            print(f"❌ Backend service returned status {response.status_code}")
            return False
    except Exception as e:
        print(f"❌ Failed to connect to backend service: {e}")
        return False

def test_file_upload():
    """Test file upload to backend"""
    print("\n📤 Testing file upload...")
    
    # Create a test PDF-like content
    test_content = f"""Test Compliance Report
Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

This is a test file to verify the Google Drive backend integration.

Compliance Data:
- Temperature: 72°F ✅
- Humidity: 45% RH ✅
- Pressure: 0.025" WC ✅
- Staff: TEST
- Status: COMPLIANT

This file can be safely deleted after testing.
"""
    
    # Encode as base64 (simulating PDF blob)
    encoded_content = base64.b64encode(test_content.encode('utf-8')).decode('utf-8')
    
    filename = f"Backend-Test-{datetime.now().strftime('%Y%m%d-%H%M%S')}.txt"
    
    payload = {
        'filename': filename,
        'content': encoded_content,
        'content_type': 'text/plain',
        'encoding': 'base64'
    }
    
    try:
        response = requests.post(
            f'{BACKEND_URL}/upload',
            headers={'Content-Type': 'application/json'},
            data=json.dumps(payload)
        )
        
        if response.status_code == 200:
            result = response.json()
            print(f"✅ File upload successful!")
            print(f"   Filename: {result.get('name', filename)}")
            print(f"   File ID: {result.get('file_id', 'N/A')}")
            print(f"   Message: {result.get('message', 'Upload completed')}")
            return True
        else:
            print(f"❌ Upload failed with status {response.status_code}")
            print(f"   Response: {response.text}")
            return False
            
    except Exception as e:
        print(f"❌ Upload test failed: {e}")
        return False

def test_frontend_integration():
    """Test if frontend can connect to backend"""
    print("\n🌐 Testing frontend integration...")
    
    # Simulate what the frontend would do
    try:
        # Check status (what frontend does on startup)
        status_response = requests.get(f'{BACKEND_URL}/status')
        if status_response.status_code == 200:
            print("✅ Frontend can connect to backend status endpoint")
            
            # Test CORS headers
            if 'Access-Control-Allow-Origin' in status_response.headers:
                print("✅ CORS headers are present")
            else:
                print("⚠️  CORS headers missing (may cause frontend issues)")
            
            return True
        else:
            print("❌ Frontend cannot connect to backend")
            return False
            
    except Exception as e:
        print(f"❌ Frontend integration test failed: {e}")
        return False

def main():
    """Run all backend tests"""
    print("🚀 Google Drive Backend Service Test Suite")
    print("=" * 50)
    
    tests_passed = 0
    total_tests = 3
    
    # Test 1: Backend Status
    if test_backend_status():
        tests_passed += 1
    
    # Test 2: File Upload
    if test_file_upload():
        tests_passed += 1
    
    # Test 3: Frontend Integration
    if test_frontend_integration():
        tests_passed += 1
    
    # Summary
    print("\n" + "=" * 50)
    print(f"📊 Test Results: {tests_passed}/{total_tests} tests passed")
    
    if tests_passed == total_tests:
        print("🎉 All tests passed! Backend service is working correctly.")
        print("\n📋 Next Steps:")
        print("   1. Open Pharmacy_Compliance_Backend.html in your browser")
        print("   2. Login with: admin / pharmacy123")
        print("   3. Record some compliance data")
        print("   4. Check that PDFs are generated and uploaded")
    else:
        print("⚠️  Some tests failed. Check the backend service configuration.")
    
    print(f"\n🔗 Backend Service: {BACKEND_URL}")
    print(f"📁 Upload Endpoint: {BACKEND_URL}/upload")
    print(f"📊 Status Endpoint: {BACKEND_URL}/status")

if __name__ == "__main__":
    main()