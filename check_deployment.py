#!/usr/bin/env python3
"""
Check if Render deployment is working
"""

import requests
import json
import time

def check_backend_status():
    """Check if the backend is deployed and working"""
    
    urls_to_check = [
        'https://pharmacy-compliance-backend.onrender.com/',
        'https://pharmacy-compliance-backend.onrender.com/status',
        'https://pharmacy-compliance-backend.onrender.com/health'
    ]
    
    print("🔍 Checking Render Backend Deployment")
    print("=" * 50)
    
    all_working = True
    
    for url in urls_to_check:
        print(f"\n🧪 Testing: {url}")
        
        try:
            response = requests.get(url, timeout=10)
            
            if response.status_code == 200:
                print(f"✅ Status: {response.status_code} OK")
                
                try:
                    data = response.json()
                    print(f"📋 Response: {data.get('status', 'N/A')}")
                    
                    if 'service' in data:
                        print(f"🔧 Service: {data['service']}")
                    
                    if 'cors_enabled' in data:
                        print(f"🌐 CORS: {'✅ Enabled' if data['cors_enabled'] else '❌ Disabled'}")
                        
                except json.JSONDecodeError:
                    print(f"📋 Response: {response.text[:100]}...")
                    
            else:
                print(f"❌ Status: {response.status_code}")
                print(f"📋 Error: {response.text[:100]}...")
                all_working = False
                
        except requests.exceptions.RequestException as e:
            print(f"❌ Connection failed: {e}")
            all_working = False
    
    print("\n" + "=" * 50)
    
    if all_working:
        print("🎉 SUCCESS: Backend is deployed and working!")
        print("✅ Your app should now connect without CORS errors")
        print("🔗 Visit: https://labreporttool.xyz to test")
    else:
        print("⚠️ ISSUES DETECTED: Backend may not be fully deployed")
        print("📋 Check Render dashboard for deployment status")
        print("🔗 Dashboard: https://render.com/dashboard")
    
    return all_working

def wait_for_deployment(max_wait_minutes=10):
    """Wait for deployment to complete"""
    
    print(f"⏳ Waiting for deployment (max {max_wait_minutes} minutes)...")
    
    for minute in range(max_wait_minutes):
        print(f"\n🔄 Check {minute + 1}/{max_wait_minutes}...")
        
        if check_backend_status():
            return True
            
        if minute < max_wait_minutes - 1:
            print("⏳ Waiting 60 seconds before next check...")
            time.sleep(60)
    
    print(f"\n⏰ Timeout: Deployment not ready after {max_wait_minutes} minutes")
    return False

if __name__ == '__main__':
    print("🚀 Render Backend Deployment Checker")
    print("=" * 50)
    
    # Check current status
    if not check_backend_status():
        print("\n🤔 Backend not ready. Would you like to wait for deployment?")
        response = input("Wait for deployment? (y/n): ").lower().strip()
        
        if response == 'y':
            wait_for_deployment()
        else:
            print("📋 Manual check: Visit https://render.com/dashboard to check deployment status")