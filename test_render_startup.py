#!/usr/bin/env python3
"""
Simple test script to verify Render startup
"""

import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify({
        'message': 'Render startup test successful!',
        'port': os.environ.get('PORT', 'not set'),
        'render': os.environ.get('RENDER', 'not set')
    })

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'}), 200

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8001))
    print(f"🧪 Test server starting on port: {port}")
    print(f"🌍 Environment variables:")
    print(f"   PORT: {os.environ.get('PORT', 'not set')}")
    print(f"   RENDER: {os.environ.get('RENDER', 'not set')}")
    
    app.run(host='0.0.0.0', port=port, debug=False)