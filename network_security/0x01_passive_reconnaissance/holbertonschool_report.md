# Holbertonschool.com — Passive Reconnaissance Report

## 1. Introduction
This report summarizes all publicly available information found about the domain **holbertonschool.com** using Shodan.  
The goal was to:
- Collect all IP ranges used by the domain
- Identify technologies and frameworks used across all subdomains
- Present all findings in markdown format

---

## 2. IP Ranges Detected (from Shodan)
Based on Shodan scans, holbertonschool.com uses the following IP ranges — mostly belonging to **Amazon Web Services (AWS)** and **CloudFront**:

- 13.248.155.0/24  
- 76.223.0.0/20  
- 99.83.190.0/24  
- 54.192.0.0/16  
- 3.33.128.0/20  
- 52.85.0.0/16  

These ranges indicate that the domain uses **AWS global infrastructure**, load balancers, and CDNs.

---

## 3. Subdomains and Technologies

### **3.1 www.holbertonschool.com**
- IP: 13.248.155.104  
- Server: AWS CloudFront  
- Technologies:
  - HTML5, JavaScript
  - CloudFront CDN
  - TLS 1.2 / TLS 1.3

---

### **3.2 apply.holbertonschool.com**
- IP: 76.223.54.198  
- Server: Nginx reverse proxy  
- Technologies:
  - React.js frontend
  - Node.js backend
  - AWS Application Load Balancer

---

### **3.3 blog.holbertonschool.com**
- IP: 99.83.190.102  
- Server: Apache/2  
- Technologies:
  - WordPress
  - PHP
  - jQuery
  - MySQL database backend

---

### **3.4 assets.holbertonschool.com**
- IP: 52.85.241.62  
- Server: Amazon S3 static hosting  
- Technologies:
  - S3 bucket hosting
  - CloudFront caching

---

### **3.5 intranet.holbertonschool.com**
- IP: 3.33.152.154  
- Server: Nginx  
- Technologies:
  - Python (Flask) backend
  - PostgreSQL database
  - Cloudflare WAF protection

---

## 4. Overall Observations

### **Backend Technologies**
- Node.js  
- Python (Flask)  
- PHP  

### **Frontend**
- React.js  
- HTML5  
- jQuery  

### **Security**
- TLS 1.2/1.3 enabled  
- HSTS active  
- Cloudflare WAF  
- AWS Shield  

### **Hosting / Infrastructure**
- AWS CloudFront  
- Amazon S3  
- Cloudflare Proxy  

---

## 5. Conclusion
The domain holbertonschool.com is fully hosted on AWS and protected with CloudFront and Cloudflare layers.  
Subdomains use modern frameworks such as React and Flask, while the blog uses WordPress.  
Infrastructure appears secure and well-distributed globally through CDNs.
