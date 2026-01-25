# DNS Configuration for labreporttool.xyz

## Current GitHub Pages Setup
- Repository: https://github.com/Jared-T-Proctor-JTP34/LabReport
- GitHub Pages URL: https://jared-t-proctor-jtp34.github.io/LabReport/
- Custom Domain: labreporttool.xyz

## Required DNS Records

### For GitHub Pages (Apex Domain)
Add these A records to point your domain to GitHub Pages:

```
Type: A
Name: @ (or root/apex)
Value: 185.199.108.153

Type: A
Name: @ (or root/apex)
Value: 185.199.109.153

Type: A
Name: @ (or root/apex)
Value: 185.199.110.153

Type: A
Name: @ (or root/apex)
Value: 185.199.111.153
```

### IPv6 Support (Optional but Recommended)
```
Type: AAAA
Name: @ (or root/apex)
Value: 2606:50c0:8000::153

Type: AAAA
Name: @ (or root/apex)
Value: 2606:50c0:8001::153

Type: AAAA
Name: @ (or root/apex)
Value: 2606:50c0:8002::153

Type: AAAA
Name: @ (or root/apex)
Value: 2606:50c0:8003::153
```

## Current DNS Settings (Exported: 2026-01-24 20:24:58)

**DNS Provider:** GoDaddy (ns41.domaincontrol.com, ns42.domaincontrol.com)

### Current A Records
```
@	3600	IN	A	WebsiteBuilder Site (needs to be replaced)
www.labreporttool.xyz	3600	IN	A	15.197.225.128 (GoDaddy website builder)
www.labreporttool.xyz	3600	IN	A	3.33.251.168 (GoDaddy website builder)
```

### Current CNAME Records
```
pay	3600	IN	CNAME	paylinks.commerce.godaddy.com.
www	3600	IN	CNAME	@ (points to root domain)
_domainconnect	3600	IN	CNAME	_domainconnect.gd.domaincontrol.com.
```

### Other Records
```
SOA: ns41.domaincontrol.com. dns.jomax.net.
NS: ns41.domaincontrol.com., ns42.domaincontrol.com.
TXT (_dmarc): "v=DMARC1; p=quarantine; adkim=r; aspf=r; rua=mailto:dmarc_rua@onsecureserver.net;"
```

**Status:** ⚠️ Currently pointing to GoDaddy Website Builder - NEEDS UPDATE

## Required Changes for GitHub Pages

### ⚠️ IMPORTANT: You need to update your DNS records in GoDaddy

**Current Issue:** Your domain is pointing to GoDaddy's Website Builder service. To use GitHub Pages, you need to change the A records.

### Step-by-Step Instructions for GoDaddy:

1. **Login to GoDaddy Domain Manager**
   - Go to https://dcc.godaddy.com/
   - Find your domain: labreporttool.xyz
   - Click "DNS" or "Manage DNS"

2. **Update A Records**
   Replace the current A records with these GitHub Pages IPs:
   ```
   Type: A
   Name: @ (root domain)
   Value: 185.199.108.153
   TTL: 3600 (or 1 hour)

   Type: A
   Name: @ (root domain)
   Value: 185.199.109.153
   TTL: 3600

   Type: A
   Name: @ (root domain)
   Value: 185.199.110.153
   TTL: 3600

   Type: A
   Name: @ (root domain)
   Value: 185.199.111.153
   TTL: 3600
   ```

3. **Keep These Records (Don't Change)**
   - NS records (ns41.domaincontrol.com, ns42.domaincontrol.com)
   - DMARC TXT record
   - _domainconnect CNAME (if you want to keep GoDaddy services)

4. **Optional: Update WWW Record**
   The current www CNAME pointing to @ is fine, but you could also point www directly to GitHub:
   ```
   Type: CNAME
   Name: www
   Value: jared-t-proctor-jtp34.github.io
   ```

### What to Remove/Replace:
- ❌ Remove: Current A records pointing to GoDaddy Website Builder
- ❌ Remove: pay CNAME (unless you need GoDaddy commerce)
- ✅ Keep: NS records, DMARC, _domainconnect (optional)

## Setup Instructions

1. **Configure DNS Records** (with your domain provider)
   - Add the A records listed above
   - Optionally add AAAA records for IPv6 support

2. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Set source to "Deploy from a branch"
   - Select "main" branch and "/ (root)" folder
   - Add custom domain: labreporttool.xyz
   - Enable "Enforce HTTPS"

3. **Verify Setup**
   - DNS propagation can take 24-48 hours
   - Check status at: https://www.whatsmydns.net/#A/labreporttool.xyz
   - Test GitHub Pages at: https://jared-t-proctor-jtp34.github.io/LabReport/

## Troubleshooting

- **DNS not propagating:** Wait 24-48 hours, DNS changes take time
- **HTTPS not available:** Wait for DNS to fully propagate first
- **404 errors:** Ensure repository is public and Pages is enabled
- **Custom domain not working:** Verify CNAME file contains correct domain

## Contact Information
- Repository Owner: Jared T Proctor
- Email: jared9689098@gmail.com
- Domain: labreporttool.xyz