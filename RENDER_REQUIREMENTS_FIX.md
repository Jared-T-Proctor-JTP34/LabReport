# 🔧 RENDER REQUIREMENTS FILE FIX

## ❌ **PROBLEM**
```
ERROR: Could not open requirements file: [Errno 2] No such file or directory: 'requirements_minimal.txt'
```

The file doesn't exist in your GitHub repository yet.

## ✅ **IMMEDIATE FIX - Use Existing File**

**Change your Render build command to:**
```
pip install -r requirements.txt
```

**Keep start command as:**
```
python minimal_backend.py
```

## 🎯 **WHY THIS WORKS**

Your existing `requirements.txt` contains:
```
flask==2.3.3
flask-cors==4.0.0
google-auth==2.23.4
google-auth-oauthlib==1.1.0
google-auth-httplib2==0.1.1
google-api-python-client==2.108.0
gunicorn==21.2.0
```

The `minimal_backend.py` only needs Flask, so it will work fine with these dependencies.

## 📋 **RENDER SETTINGS (CORRECT)**

1. **Build Command**: `pip install -r requirements.txt`
2. **Start Command**: `python minimal_backend.py`
3. **Environment**: Python 3
4. **Plan**: Free

## 🚀 **EXPECTED RESULT**

**Build will succeed** because:
- ✅ `requirements.txt` exists in your repository
- ✅ Contains Flask (which is all we need)
- ✅ `minimal_backend.py` uses only Flask features

**Service will start** and show:
```
🚀 MINIMAL BACKEND STARTING
📍 Port: 10000
📋 Routes available:
   GET /
   GET /health
   GET /status
   GET /test
```

## 🎯 **TEST AFTER DEPLOYMENT**

Visit:
```
https://pharmacy-compliance-backend.onrender.com/
```

Should return:
```json
{
  "status": "SUCCESS",
  "service": "Pharmacy Compliance Backend",
  "message": "Backend is working on Render!",
  "port": "10000"
}
```

**This will definitely work since we're using the existing requirements.txt file! 🚀**