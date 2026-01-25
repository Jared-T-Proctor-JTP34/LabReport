#!/usr/bin/env python3
"""
Simple HTTPS server for testing Google Drive integration locally.
This creates a self-signed certificate and serves files over HTTPS.
"""

import http.server
import ssl
import os
import socket
from datetime import datetime, timedelta
import subprocess
import sys

def create_self_signed_cert():
    """Create a self-signed certificate for localhost"""
    try:
        # Try to create certificate using openssl if available
        subprocess.run([
            'openssl', 'req', '-x509', '-newkey', 'rsa:4096', '-keyout', 'key.pem', 
            '-out', 'cert.pem', '-days', '365', '-nodes', '-subj', 
            '/C=US/ST=State/L=City/O=Organization/CN=localhost'
        ], check=True, capture_output=True)
        print("✅ Created self-signed certificate using OpenSSL")
        return True
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("⚠️  OpenSSL not available, trying Python cryptography...")
        
    try:
        # Try using Python cryptography library
        from cryptography import x509
        from cryptography.x509.oid import NameOID
        from cryptography.hazmat.primitives import hashes, serialization
        from cryptography.hazmat.primitives.asymmetric import rsa
        import ipaddress
        
        # Generate private key
        private_key = rsa.generate_private_key(
            public_exponent=65537,
            key_size=2048,
        )
        
        # Create certificate
        subject = issuer = x509.Name([
            x509.NameAttribute(NameOID.COUNTRY_NAME, "US"),
            x509.NameAttribute(NameOID.STATE_OR_PROVINCE_NAME, "State"),
            x509.NameAttribute(NameOID.LOCALITY_NAME, "City"),
            x509.NameAttribute(NameOID.ORGANIZATION_NAME, "Test Organization"),
            x509.NameAttribute(NameOID.COMMON_NAME, "localhost"),
        ])
        
        cert = x509.CertificateBuilder().subject_name(
            subject
        ).issuer_name(
            issuer
        ).public_key(
            private_key.public_key()
        ).serial_number(
            x509.random_serial_number()
        ).not_valid_before(
            datetime.utcnow()
        ).not_valid_after(
            datetime.utcnow() + timedelta(days=365)
        ).add_extension(
            x509.SubjectAlternativeName([
                x509.DNSName("localhost"),
                x509.IPAddress(ipaddress.IPv4Address("127.0.0.1")),
            ]),
            critical=False,
        ).sign(private_key, hashes.SHA256())
        
        # Write private key
        with open("key.pem", "wb") as f:
            f.write(private_key.private_bytes(
                encoding=serialization.Encoding.PEM,
                format=serialization.PrivateFormat.PKCS8,
                encryption_algorithm=serialization.NoEncryption()
            ))
        
        # Write certificate
        with open("cert.pem", "wb") as f:
            f.write(cert.public_bytes(serialization.Encoding.PEM))
            
        print("✅ Created self-signed certificate using Python cryptography")
        return True
        
    except ImportError:
        print("❌ Python cryptography library not available")
        print("   Install with: pip install cryptography")
        return False
    except Exception as e:
        print(f"❌ Failed to create certificate: {e}")
        return False

def start_https_server(port=8000):
    """Start HTTPS server"""
    
    # Check if certificate files exist
    if not (os.path.exists('cert.pem') and os.path.exists('key.pem')):
        print("🔐 Creating self-signed certificate for HTTPS...")
        if not create_self_signed_cert():
            print("❌ Could not create SSL certificate")
            print("   Google Drive integration requires HTTPS")
            print("   You can deploy to labreporttool.xyz instead")
            return False
    
    try:
        # Create HTTP server
        server_address = ('localhost', port)
        httpd = http.server.HTTPServer(server_address, http.server.SimpleHTTPRequestHandler)
        
        # Wrap with SSL
        context = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
        context.load_cert_chain(certfile="cert.pem", keyfile="key.pem")
        httpd.socket = context.wrap_socket(httpd.socket, server_side=True)
        
        print(f"🚀 HTTPS Server started at https://localhost:{port}")
        print("📁 Serving files from current directory")
        print("🔒 You may need to accept the self-signed certificate warning in your browser")
        print("🧪 You can now test Google Drive integration!")
        print("⏹️  Press Ctrl+C to stop the server")
        print()
        print("🌐 Main app: https://localhost:8000/Pharmacy_Compliance_Backend.html")
        print("🌐 Entry point: https://localhost:8000/index.html")
        print()
        
        httpd.serve_forever()
        
    except KeyboardInterrupt:
        print("\n⏹️  Server stopped by user")
        return True
    except Exception as e:
        print(f"❌ Server error: {e}")
        return False

if __name__ == "__main__":
    port = 8000
    if len(sys.argv) > 1:
        try:
            port = int(sys.argv[1])
        except ValueError:
            print("Invalid port number, using default 8000")
    
    start_https_server(port)