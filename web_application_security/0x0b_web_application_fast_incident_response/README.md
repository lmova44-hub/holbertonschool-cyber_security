
Incident Report: Distributed Denial of Service (DDoS) Mitigation

1. Introduction
This report documents a high-volume request attack identified on the organization’s web server. An analysis of the web logs revealed a concentrated effort to overwhelm the server's resources, specifically targeting the root endpoint. The purpose of this report is to analyze the incident and propose a robust mitigation strategy to maintain high availability.

2. Detailed Attack Analysis
*   **Attack Source:** The primary attacker was identified as IP address `54.145.34.34`.
*   **Targeted Endpoint:** The attack was focused almost exclusively on the root directory (`/`).
*   **Request Volume:** A total of `5,000` requests were sent by the identified IP within a short timeframe.
*   **Tools/Library Used:** Analysis of the User-Agent strings indicates the use of `python-requests/2.31.0`, suggesting an automated script rather than legitimate browser traffic.

3. Proposed Mitigation Strategy: Rate Limiting and WAF Implementation
The most effective solution to mitigate this type of automated high-volume attack is the implementation of **Rate Limiting** via a Web Application Firewall (WAF) or a reverse proxy (like Nginx).

4. Justification for the Proposed Solution
Rate limiting is an industry-standard defense against Denial of Service (DoS) attacks and brute-force attempts. By limiting the number of requests a single IP can make within a specific timeframe (e.g., 10 requests per second), the server can prioritize legitimate users while dropping malicious automated traffic before it consumes application-layer resources.

5. Steps for Implementation
1.  **Identify Baselines:** Determine the average number of requests a legitimate user makes.
2.  **Configure Nginx/WAF:**
    *   Define a limit zone: `limit_req_zone $binary_remote_addr zone=mylimit:10m rate=10r/s;`
    *   Apply the limit to the target location: `limit_req zone=mylimit burst=20;`
3.  **IP Blacklisting:** Permanently block the identified attacker IP (`54.145.34.34`) at the firewall level (iptables or Cloud Security Group).
4.  **User-Agent Filtering:** Block requests originating from non-browser libraries like `python-requests` if they are not required for API operations.

6. Post-Implementation Monitoring
To ensure the solution is effective and does not produce false positives:
*   **Log Analysis:** Use tools like the ELK Stack (Elasticsearch, Logstash, Kibana) or Splunk to visualize request trends.
*   **Alerting:** Set up real-time alerts in Prometheus or Grafana to notify the security team when an IP exceeds 80% of the allowed rate limit.
*   **Health Checks:** Use uptime monitoring (like UptimeRobot) to ensure the endpoint `/` remains responsive.

7. Conclusion
The analyzed incident was a textbook automated DoS attack using Python-based scripts. By implementing **Rate Limiting**, the organization can effectively "throttle" such attacks, ensuring that server resources are never exhausted by a single malicious source. Continuous monitoring and proactive firewall management are essential to the long-term security of the web application.

