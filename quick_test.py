import requests
import time

def quick_test():
    urls = [
        'https://labreport-q96c.onrender.com/status',
        'https://labreport-q96c.onrender.com/health',
        'https://labreport-q96c.onrender.com/'
    ]
    
    print("🧪 Testing your deployed backend...")
    print("=" * 50)
    
    for url in urls:
        print(f"\n🔍 Testing: {url}")
        
        try:
            response = requests.get(url, timeout=10)
            print(f"✅ Status: {response.status_code}")
            
            if response.status_code == 200:
                try:
                    data = response.json()
                    print(f"📋 Service: {data.get('service', 'Unknown')}")
                    print(f"🔧 Status: {data.get('status', 'Unknown')}")
                    if 'cors_enabled' in data:
                        print(f"🌐 CORS: {'✅ Enabled' if data['cors_enabled'] else '❌ Disabled'}")
                except:
                    print(f"📋 Response: {response.text[:100]}...")
                    
                if url.endswith('/status'):
                    print(f"🎉 SUCCESS: Backend is working!")
                    return True
            else:
                print(f"❌ Error: {response.text[:100]}")
                
        except Exception as e:
            print(f"❌ Failed: {e}")
    
    print("\n⚠️ Backend not responding properly")
    return False

if __name__ == '__main__':
    if quick_test():
        print("\n🚀 Next step: Visit https://labreporttool.xyz to test your app!")
    else:
        print("\n🔧 Check your Render service deployment and logs")