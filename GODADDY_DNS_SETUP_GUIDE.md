# GoDaddy DNS Setup Guide for labreporttool.xyz

## 🎯 Goal
Change your domain from pointing to GoDaddy Website Builder to GitHub Pages

## 📋 Step-by-Step Instructions

### Step 1: Access GoDaddy Domain Manager
1. **Go to GoDaddy:** https://www.godaddy.com/
2. **Sign in** to your GoDaddy account
3. **Click "My Products"** or go directly to: https://account.godaddy.com/products
4. **Find your domain:** `labreporttool.xyz`
5. **Click "DNS"** button next to your domain (or click the domain name, then "DNS")

### Step 2: Locate Current DNS Records
You should see a page titled "DNS Management for labreporttool.xyz"

**Current records you'll see:**
```
Type    Name    Value                           TTL
A       @       WebsiteBuilder Site            1 Hour
A       www     15.197.225.128                 1 Hour  
A       www     3.33.251.168                   1 Hour
CNAME   www     @                              1 Hour
CNAME   pay     paylinks.commerce.godaddy.com  1 Hour
```

### Step 3: Delete Current A Records
**⚠️ IMPORTANT: Only delete the A records, keep NS and other records!**

1. **Find the A record** with Name "@" and Value "WebsiteBuilder Site"
   - Click the **pencil/edit icon** or **trash/delete icon**
   - **Delete this record**

2. **Find the A records** with Name "www" 
   - Delete the one pointing to `15.197.225.128`
   - Delete the one pointing to `3.33.251.168`

### Step 4: Add New GitHub Pages A Records
**Click "Add" or "Add Record" button**

**Add these 4 A records one by one:**

**Record 1:**
- Type: `A`
- Name: `@` (this means root domain)
- Value: `185.199.108.153`
- TTL: `1 Hour` (or 3600 seconds)

**Record 2:**
- Type: `A`
- Name: `@`
- Value: `185.199.109.153`
- TTL: `1 Hour`

**Record 3:**
- Type: `A`
- Name: `@`
- Value: `185.199.110.153`
- TTL: `1 Hour`

**Record 4:**
- Type: `A`
- Name: `@`
- Value: `185.199.111.153`
- TTL: `1 Hour`

### Step 5: Update WWW Record (Optional but Recommended)
**Find the CNAME record** with Name "www"
- **Edit** the existing www CNAME record
- Change Value from `@` to: `jared-t-proctor-jtp34.github.io`
- Keep TTL as `1 Hour`

### Step 6: Keep These Records (DON'T DELETE)
**✅ KEEP these records unchanged:**
- **NS records** (ns41.domaincontrol.com, ns42.domaincontrol.com)
- **_dmarc TXT record** (email security)
- **_domainconnect CNAME** (optional, for GoDaddy services)

**❓ Optional to remove:**
- **pay CNAME** (only if you don't use GoDaddy commerce)

### Step 7: Save Changes
1. **Click "Save"** or "Save Changes"
2. **Confirm** any prompts about changing DNS records
3. **Wait for confirmation** that changes were saved

## 🕐 After Making Changes

### Expected Timeline:
- **Immediate:** Changes saved in GoDaddy
- **15-30 minutes:** Some DNS servers update
- **1-4 hours:** Most DNS servers update  
- **24-48 hours:** All DNS servers worldwide update

### How to Check Progress:
1. **Test DNS propagation:** https://www.whatsmydns.net/#A/labreporttool.xyz
2. **Check GitHub Pages:** https://github.com/Jared-T-Proctor-JTP34/LabReport/settings/pages
3. **Test your site:** https://labreporttool.xyz (may take time to work)

## 🔧 Final GitHub Pages Setup

**After DNS changes are made:**
1. Go to: https://github.com/Jared-T-Proctor-JTP34/LabReport/settings/pages
2. Under "Custom domain" enter: `labreporttool.xyz`
3. Click "Save"
4. Wait for green checkmark ✅
5. Enable "Enforce HTTPS" (appears after domain verification)

## ✅ Success Indicators

**You'll know it's working when:**
- ✅ https://labreporttool.xyz shows your pharmacy app landing page
- ✅ GitHub Pages shows green checkmark for custom domain
- ✅ HTTPS certificate is automatically issued
- ✅ Both www.labreporttool.xyz and labreporttool.xyz work

## 🆘 Troubleshooting

**If something goes wrong:**
1. **Restore from backup:** Use the settings in `DNS_BACKUP.txt`
2. **Check DNS:** Make sure you didn't delete NS records
3. **Wait longer:** DNS can take up to 48 hours
4. **Contact support:** GoDaddy support can help restore settings

## 📞 Need Help?
- **GoDaddy Support:** 1-480-505-8877
- **GitHub Pages Docs:** https://docs.github.com/en/pages
- **DNS Checker:** https://www.whatsmydns.net/

---

**⚠️ BACKUP REMINDER:** Your original DNS settings are saved in `DNS_BACKUP.txt` in case you need to restore them!