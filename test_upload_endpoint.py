#!/usr/bin/env python3
"""
Test the upload endpoint to see what's causing the 500 error
"""

import requests
import json
import base64

def test_upload_endpoint():
    """Test the /upload endpoint"""
    
    backend_url = 'https://labreport-q96c.onrender.com'
    
    print("🧪 Testing Upload Endpoint")
    print("=" * 50)
    
    # Test 1: Check status endpoint
    print("1. Testing status endpoint...")
    try:
        response = requests.get(f"{backend_url}/status", timeout=10)
        if response.status_code == 200:
            data = response.json()
            print(f"✅ Status: {data.get('status')}")
            print(f"🔧 Google Drive Ready: {data.get('drive_service_ready', False)}")
        else:
            print(f"❌ Status error: {response.status_code}")
    except Exception as e:
        print(f"❌ Status failed: {e}")
    
    # Test 2: Test upload endpoint with minimal data
    print("\n2. Testing upload endpoint...")
    try:
        # Create a simple test file
        test_content = "Test PDF content for upload"
        test_filename = "test-upload.txt"
        
        # Encode content as base64 (like the frontend does)
        encoded_content = base64.b64encode(test_content.encode('utf-8')).decode('utf-8')
        
        upload_data = {
            'filename': test_filename,
            'content': encoded_content,
            'content_type': 'text/plain',
            'encoding': 'base64'
        }
        
        print(f"📤 Uploading test file: {test_filename}")
        response = requests.post(
            f"{backend_url}/upload",
            json=upload_data,
            headers={'Content-Type': 'application/json'},
            timeout=30
        )
        
        print(f"📋 Response Status: {response.status_code}")
        
        if response.status_code == 200:
            result = response.json()
            print("✅ Upload successful!")
            print(f"📁 File ID: {result.get('file_id')}")
            print(f"🔗 View Link: {result.get('web_view_link')}")
        else:
            print(f"❌ Upload failed: {response.status_code}")
            try:
                error_data = response.json()
                print(f"📋 Error: {error_data}")
            except:
                print(f"📋 Error Text: {response.text[:500]}")
                
    except Exception as e:
        print(f"❌ Upload test failed: {e}")
    
    # Test 3: Check backend logs endpoint if available
    print("\n3. Checking for error details...")
    try:
        response = requests.get(f"{backend_url}/", timeout=10)
        if response.status_code == 200:
            data = response.json()
            print(f"📋 Backend Info: {data.get('service', 'Unknown')}")
    except Exception as e:
        print(f"❌ Backend info failed: {e}")

if __name__ == '__main__':
    test_upload_endpoint()