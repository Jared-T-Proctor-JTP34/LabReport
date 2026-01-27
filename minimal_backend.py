#!/usr/bin/env python3
"""
Minimal Working Backend for Render
Just provides basic endpoints with proper CORS
"""

import os
from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)

# Configure CORS to allow your domain
CORS(app, origins=[
    'https://labreporttool.xyz',
    'https://jared-t-proctor-jtp34.github.io',
    'http://localhost:*',
    'http://127.0.0.1:*'
], supports_credentials=True)

@app.route('/')
def root():
    """Root endpoint"""
    return jsonify({
        'service': 'Pharmacy Compliance Backend - Minimal',
        'status': 'running',
        'message': 'Backend is working!',
        'version': '1.0.0',
        'endpoints': ['/status', '/health', '/']
    })

@app.route('/status')
def status():
    """Status endpoint"""
    return jsonify({
        'status': 'running',
        'service': 'Minimal Pharmacy Backend',
        'drive_service_ready': False,  # No Google Drive in minimal version
        'message': 'Backend running - Google Drive not configured',
        'environment': 'render' if os.environ.get('RENDER') else 'local',
        'cors_enabled': True
    })

@app.route('/health')
def health():
    """Health check for Render"""
    return jsonify({
        'status': 'healthy',
        'service': 'minimal-backend'
    }), 200

if __name__ == '__main__':
    # Get port from Render environment
    port = int(os.environ.get('PORT', 8002))
    host = '0.0.0.0'
    
    print(f"🚀 Starting minimal backend on {host}:{port}")
    print("✅ CORS configured for labreporttool.xyz")
    print("📋 Endpoints: /, /status, /health")
    
    app.run(host=host, port=port, debug=False)