#!/usr/bin/env python3
"""
Debug Backend - Shows all environment variables and port info
"""

import os
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route('/')
def root():
    """Root endpoint with full debug info"""
    return jsonify({
        'service': 'Debug Backend for Render',
        'status': 'running',
        'port_info': {
            'PORT_env_var': os.environ.get('PORT', 'NOT SET'),
            'actual_port': os.environ.get('PORT', 8001),
            'render_detected': os.environ.get('RENDER', 'NOT SET')
        },
        'all_env_vars': {key: value for key, value in os.environ.items() if not key.startswith('GOOGLE_')},
        'google_env_count': len([k for k in os.environ.keys() if k.startswith('GOOGLE_')])
    })

@app.route('/health')
def health():
    """Health check"""
    return jsonify({'status': 'healthy', 'port': os.environ.get('PORT', 'not set')}), 200

@app.route('/port-test')
def port_test():
    """Port testing endpoint"""
    return jsonify({
        'message': 'Port test successful',
        'PORT_from_env': os.environ.get('PORT'),
        'all_port_related': {k: v for k, v in os.environ.items() if 'PORT' in k.upper()}
    })

if __name__ == '__main__':
    # Debug port detection
    port_env = os.environ.get('PORT')
    port = int(port_env) if port_env else 8001
    
    print("=" * 60)
    print("🔍 DEBUG BACKEND STARTING")
    print("=" * 60)
    print(f"📍 PORT environment variable: {repr(port_env)}")
    print(f"📍 Using port: {port}")
    print(f"🌍 Host: 0.0.0.0")
    print(f"🔧 RENDER env var: {repr(os.environ.get('RENDER'))}")
    print(f"📊 Total environment variables: {len(os.environ)}")
    print("=" * 60)
    
    # Print all environment variables (except sensitive ones)
    print("🔍 Environment Variables:")
    for key, value in sorted(os.environ.items()):
        if not key.startswith('GOOGLE_') and 'KEY' not in key and 'SECRET' not in key:
            print(f"   {key} = {repr(value)}")
    print("=" * 60)
    
    try:
        app.run(host='0.0.0.0', port=port, debug=False)
    except Exception as e:
        print(f"❌ Failed to start on port {port}: {e}")
        # Try alternative ports
        for alt_port in [10000, 5000, 3000]:
            try:
                print(f"🔄 Trying port {alt_port}...")
                app.run(host='0.0.0.0', port=alt_port, debug=False)
                break
            except Exception as alt_e:
                print(f"❌ Port {alt_port} failed: {alt_e}")
        else:
            print("❌ All ports failed!")
            raise