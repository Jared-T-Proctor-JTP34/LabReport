# 🌐 RENDER IP ADDRESS RANGES

## 📋 **RENDER SERVICE IP RANGES**

Your Render backend service may use these IP address ranges:

```
74.220.50.0/24
74.220.58.0/24
```

## 🔧 **COMMON USE CASES**

### **1. Firewall Configuration**
If you need to whitelist Render's IP ranges in your firewall:
```
Allow: 74.220.50.0/24 (74.220.50.1 - 74.220.50.254)
Allow: 74.220.58.0/24 (74.220.58.1 - 74.220.58.254)
```

### **2. Google Cloud Console - Service Account Security**
If configuring IP restrictions for your service account:
- **Google Cloud Console** → **IAM & Admin** → **Service Accounts**
- **Select**: `pharmacy-compliance-reports@lap-reports.iam.gserviceaccount.com`
- **Security** → **IP Address Restrictions**
- **Add**: `74.220.50.0/24` and `74.220.58.0/24`

### **3. Google Drive API Restrictions**
If you need to restrict API access by IP:
- **Google Cloud Console** → **APIs & Services** → **Credentials**
- **Edit** your API key or OAuth client
- **Application restrictions** → **IP addresses**
- **Add**: Both IP ranges

### **4. Network Security Groups (if using other cloud services)**
```
Inbound Rules:
- Source: 74.220.50.0/24, Protocol: HTTPS (443)
- Source: 74.220.58.0/24, Protocol: HTTPS (443)
```

## 🎯 **YOUR RENDER DEPLOYMENT**

### **Backend Service:**
- **URL**: `https://pharmacy-compliance-backend.onrender.com`
- **Possible IPs**: Within the ranges above
- **Protocol**: HTTPS only
- **Ports**: 443 (HTTPS), internal port assigned by Render

### **Security Considerations:**
- ✅ **HTTPS enforced** by Render automatically
- ✅ **TLS/SSL certificates** managed by Render
- ✅ **DDoS protection** included with Render
- ✅ **IP ranges stable** for firewall rules

## 📊 **IP RANGE BREAKDOWN**

### **74.220.50.0/24**
- **Network**: 74.220.50.0
- **Subnet Mask**: 255.255.255.0
- **Usable IPs**: 74.220.50.1 - 74.220.50.254
- **Total Hosts**: 254

### **74.220.58.0/24**
- **Network**: 74.220.58.0
- **Subnet Mask**: 255.255.255.0
- **Usable IPs**: 74.220.58.1 - 74.220.58.254
- **Total Hosts**: 254

## 🔒 **SECURITY RECOMMENDATIONS**

### **For Google Service Account:**
1. **Enable IP restrictions** using these ranges
2. **Monitor access logs** in Google Cloud Console
3. **Rotate service account keys** regularly
4. **Use least privilege** permissions

### **For API Security:**
1. **Restrict API keys** to these IP ranges if needed
2. **Enable API quotas** to prevent abuse
3. **Monitor API usage** in Google Cloud Console
4. **Use HTTPS only** (enforced by Render)

## 📋 **VERIFICATION STEPS**

### **Check Your Render Service IP:**
1. **Deploy** your service to Render
2. **Visit**: `https://pharmacy-compliance-backend.onrender.com/status`
3. **Check logs** for actual IP being used
4. **Verify** it falls within these ranges

### **Test IP Restrictions:**
1. **Apply** IP restrictions in Google Cloud
2. **Test** your backend service
3. **Verify** Google Drive uploads still work
4. **Monitor** for any access denied errors

## 🎯 **INTEGRATION WITH YOUR PHARMACY APP**

Your pharmacy compliance system will benefit from IP restrictions:
- ✅ **Enhanced security** for Google Drive uploads
- ✅ **Controlled access** to service account
- ✅ **Audit trail** of API usage
- ✅ **Compliance** with security best practices

**These IP ranges ensure your Render-hosted backend can securely access Google Drive for pharmacy compliance reporting! 🚀**