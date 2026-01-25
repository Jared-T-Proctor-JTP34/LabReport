#!/usr/bin/env python3
import requests
import json

# Test Google Drive API connectivity
api_key = 'AIzaSyCL9IVXR7NdT3Iif7Do5YTgVD-l_GCpzYk'
folder_id = '1C-5yxY7r0DafqWKrOpq9gtJrOrcCU0Sc'

try:
    # Test API key validity
    response = requests.get(f'https://www.googleapis.com/drive/v3/files/{folder_id}?key={api_key}')
    print(f'API Key Test: {response.status_code}')
    if response.status_code == 200:
        print('✅ API Key is valid')
        folder_info = response.json()
        print(f'Folder Name: {folder_info.get("name", "Unknown")}')
    else:
        print(f'❌ API Key test failed: {response.text}')
        
except Exception as e:
    print(f'❌ Connection test failed: {e}')