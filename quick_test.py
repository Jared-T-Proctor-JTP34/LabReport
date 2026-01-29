import requests
import time

def quick_test():
    urls = [
        'https://pharmacy-backend-api.onrender.com/status',
        'https://pharmacy-compliance-backend.onrender.com/status'
    ]
    
    for url in urls:
        print(f"🧪 Testing: {url}")
        
        try:
            response = requests.get(url, timeout=10)
            print(f"✅ Status: {response.status_code}")
            
            if response.status_code == 200:
                data = response.json()
                print(f"📋 Service: {data.get('service', 'Unknown')}")
                print(f"🔧 Status: {data.get('status', 'Unknown')}")
                print(f"🎉 SUCCESS: Backend is working!")
                return True
            else:
                print(f"❌ Error: {response.text[:100]}")
                
        except Exception as e:
            print(f"❌ Failed: {e}")
        
        print()
    
    print("⚠️ No working backend found")
    return False

if __name__ == '__main__':
    quick_test()