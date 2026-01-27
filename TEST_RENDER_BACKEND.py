#!/usr/bin/env python3
"""
Test Render Backend Connectivity
"""

import requests
import json

def test_backend_url(url):
    """Test if backend URL is accessible"""
    print(f"🧪 Testing: {url}")
    
    try:
        response = requests.get(url, timeout=10)
        print(f"✅ Status Code: {response.status_code}")
        
        if response.status_code == 200:
            try:
                data = response.json()
                print(f"📋 Response: {json.dumps(data, indent=2)}")
            except:
                print(f"📋 Response: {response.text[:200]}...")
        else:
            print(f"❌ Error: {response.text[:200]}...")
            
        return response.status_code == 200
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Connection failed: {e}")
        return False

def main():
    print("="*60)
    print("🔍 Render Backend Connectivity Test")
    print("="*60)
    
    # Test URLs
    urls = [
        'https://pharmacy-compliance-backend.onrender.com/',
        'https://pharmacy-compliance-backend.onrender.com/status',
        'https://pharmacy-compliance-backend.onrender.com/health'
    ]
    
    for url in urls:
        print()
        success = test_backend_url(url)
        if not success:
            print(f"⚠️ {url} is not accessible")
    
    print("\n" + "="*60)
    print("💡 If all tests fail, the Render service may need to be:")
    print("   1. Deployed from GitHub")
    print("   2. Environment variables configured")
    print("   3. Service restarted")
    print("="*60)

if __name__ == '__main__':
    main()