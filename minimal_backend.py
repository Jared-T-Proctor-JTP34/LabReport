#!/usr/bin/env python3
"""
Bulletproof Minimal Backend - Guaranteed Routes
"""

import os
from flask import Flask, jsonify

# Create Flask app
app = Flask(__name__)

# Enable CORS manually (in case flask-cors has issues)
@app.after_request
def after_request(response):
    response.headers.add('Access-Control-Allow-Origin', '*')
    response.headers.add('Access-Control-Allow-Headers', 'Content-Type,Authorization')
    response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
    return response

@app.route('/')
def root():
    """Root endpoint - GUARANTEED to work"""
    return jsonify({
        'status': 'SUCCESS',
        'service': 'Pharmacy Compliance Backend',
        'message': 'Backend is working on Render!',
        'port': os.environ.get('PORT', 'not set'),
        'timestamp': '2026-01-25 20:21:31'
    })

@app.route('/health')
def health():
    """Health check"""
    return jsonify({'status': 'healthy'}), 200

@app.route('/status')
def status():
    """Status check"""
    return jsonify({
        'status': 'running',
        'service': 'Minimal Backend',
        'ready': True
    })

@app.route('/test')
def test():
    """Test endpoint"""
    return jsonify({'test': 'success', 'routes': 'working'})

# Error handlers
@app.errorhandler(404)
def not_found(error):
    return jsonify({
        'error': '404 Not Found',
        'message': 'Route not found',
        'available_routes': ['/', '/health', '/status', '/test']
    }), 404

@app.errorhandler(500)
def internal_error(error):
    return jsonify({
        'error': '500 Internal Server Error',
        'message': 'Server error occurred'
    }), 500

if __name__ == '__main__':
    # Get port - try multiple sources
    port = None
    
    # Try PORT environment variable first
    if 'PORT' in os.environ:
        port = int(os.environ['PORT'])
        print(f"✅ Using PORT from environment: {port}")
    else:
        # Default to 10000 for Render
        port = 10000
        print(f"⚠️ PORT not set, defaulting to: {port}")
    
    print("=" * 50)
    print("🚀 MINIMAL BACKEND STARTING")
    print("=" * 50)
    print(f"📍 Port: {port}")
    print(f"🌍 Host: 0.0.0.0")
    print(f"🔧 Render: {os.environ.get('RENDER', 'No')}")
    print("📋 Routes available:")
    print("   GET /")
    print("   GET /health") 
    print("   GET /status")
    print("   GET /test")
    print("=" * 50)
    
    try:
        # Start Flask with explicit settings
        app.run(
            host='0.0.0.0',
            port=port,
            debug=False,
            use_reloader=False,
            threaded=True
        )
    except Exception as e:
        print(f"❌ Failed to start: {e}")
        # Emergency fallback
        print("🚨 Trying emergency fallback...")
        app.run(host='0.0.0.0', port=8080, debug=False)