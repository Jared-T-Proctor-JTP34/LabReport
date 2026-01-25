#!/usr/bin/env python3
"""
Minimal Flask Backend for Render - Guaranteed to Work
"""

import os
from flask import Flask, jsonify
from flask_cors import CORS

# Create Flask app
app = Flask(__name__)
CORS(app)

@app.route('/')
def root():
    """Root endpoint"""
    return jsonify({
        'service': 'Pharmacy Compliance Backend - Simple Version',
        'status': 'running',
        'message': 'Backend is working on Render!',
        'port': os.environ.get('PORT', 'not set'),
        'render_env': os.environ.get('RENDER', 'not detected')
    })

@app.route('/health')
def health():
    """Health check for Render"""
    return jsonify({'status': 'healthy'}), 200

@app.route('/status')
def status():
    """Status endpoint"""
    return jsonify({
        'status': 'running',
        'service': 'Simple Pharmacy Backend',
        'message': 'Ready for Google Drive integration',
        'environment': 'render' if os.environ.get('RENDER') else 'local'
    })

@app.route('/test')
def test():
    """Test endpoint"""
    return jsonify({
        'test': 'success',
        'message': 'Backend is responding correctly'
    })

if __name__ == '__main__':
    # Get port from Render environment
    port = int(os.environ.get('PORT', 8001))
    
    print("=" * 50)
    print("🚀 SIMPLE BACKEND STARTING")
    print("=" * 50)
    print(f"📍 Port: {port}")
    print(f"🌍 Host: 0.0.0.0")
    print(f"🔧 Render: {os.environ.get('RENDER', 'No')}")
    print(f"📊 Environment variables count: {len(os.environ)}")
    print("=" * 50)
    
    # Start Flask app (no gunicorn complexity)
    try:
        app.run(host='0.0.0.0', port=port, debug=False)
    except Exception as e:
        print(f"❌ Failed to start: {e}")
        raise