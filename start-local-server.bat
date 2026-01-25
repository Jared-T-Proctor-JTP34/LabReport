@echo off
echo Starting local HTTPS server for testing Google Drive functionality...
echo.
echo This will start a local server at https://localhost:8000
echo You can then test the Google Drive integration properly.
echo.
echo Requirements:
echo - Python must be installed
echo - You may need to accept the self-signed certificate warning
echo.
pause

REM Try Python 3 first
python -c "import http.server, ssl; server = http.server.HTTPServer(('localhost', 8000), http.server.SimpleHTTPRequestHandler); server.socket = ssl.wrap_socket(server.socket, certfile='./server.pem', server_side=True); server.serve_forever()" 2>nul

REM If that fails, try creating a simple certificate and server
if %errorlevel% neq 0 (
    echo.
    echo Python HTTPS server failed. Trying alternative method...
    echo.
    
    REM Try with Node.js if available
    node -e "const https = require('https'); const fs = require('fs'); const path = require('path'); const server = https.createServer({key: fs.readFileSync('key.pem'), cert: fs.readFileSync('cert.pem')}, (req, res) => { const filePath = path.join(__dirname, req.url === '/' ? 'index.html' : req.url); fs.readFile(filePath, (err, data) => { if (err) { res.writeHead(404); res.end('Not found'); } else { res.writeHead(200); res.end(data); } }); }); server.listen(8000, () => console.log('Server running at https://localhost:8000'));" 2>nul
    
    if %errorlevel% neq 0 (
        echo.
        echo Could not start HTTPS server automatically.
        echo.
        echo To test Google Drive functionality, you need to:
        echo 1. Deploy the files to your domain: labreporttool.xyz
        echo 2. Or set up a local HTTPS server manually
        echo 3. Or use a tool like 'http-server' with SSL
        echo.
        echo For now, the application will work but Google Drive uploads will download files locally instead.
        echo.
        pause
    )
)