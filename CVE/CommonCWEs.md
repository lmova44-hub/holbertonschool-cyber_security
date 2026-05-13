Common Weaknesses (CWEs) vary in their technical complexity and the scale of destruction they can cause. To manage them effectively, security teams often categorize them by their "exploitability" and "business impact."
Common CWE Examples & Their Impact
1. CWE-89: Improper Neutralization of Special Elements used in an SQL Command (SQL Injection)

    The Flaw: This occurs when user-supplied data is included in an SQL query without being properly "cleaned" or parameterized.

    Potential Impact: An attacker can bypass authentication, view sensitive database records (passwords, PII), or even delete entire tables. In some configurations, they can escalate to full server control.

    Severity: Usually High to Critical.

2. CWE-79: Improper Neutralization of Input During Web Page Generation (Cross-Site Scripting - XSS)

    The Flaw: The application includes untrusted data in a web page without proper validation or encoding.

    Potential Impact: An attacker injects malicious scripts into the victim's browser. This allows for session hijacking (stealing cookies), site defacement, or redirecting users to malicious websites.

    Severity: Medium to High.

3. CWE-22: Improper Limitation of a Pathname to a Restricted Directory (Path Traversal)

    The Flaw: Using external input to construct a pathname that is intended to identify a file or directory that is located under a restricted parent directory.

    Potential Impact: An attacker can access sensitive files on the server that were never meant to be public, such as /etc/passwd or configuration files containing API keys and database credentials.

    Severity: High.

4. CWE-434: Unrestricted Upload of File with Dangerous Type

    The Flaw: The application allows a user to upload a file (like a .php or .exe file) to the server's filesystem without properly verifying the file type or contents.

    Potential Impact: This often leads to Remote Code Execution (RCE). Once the file is uploaded, the attacker can execute it to gain a shell and take over the entire system.

    Severity: Critical.

Prioritization Strategy

In a development project, you cannot fix every weakness simultaneously. Prioritization should follow a risk-based framework:
Stage 1: The "Top 25" Filter

Start by identifying if any of your detected weaknesses appear on the CWE Top 25 Most Dangerous Software Weaknesses list. These are mathematically proven to be the most frequent and impactful flaws currently seen in the industry.
Stage 2: Reachability & Exposure

Ask two critical questions:

    Is it "Internet-Facing"?: A flaw in a public login page is a higher priority than a flaw in an internal admin tool used by three people.

    Is it Reachable?: Can a user actually trigger the code path that contains the weakness? If the "vulnerable" code is dead code or unreachable by user input, the priority drops.

Stage 3: Data Sensitivity

Prioritize weaknesses that sit "close" to your most valuable assets.

    High Priority: A weakness that leads to the database containing customer credit card info.

    Lower Priority: A weakness that leads to the disclosure of the server's local time or public font files.

Stage 4: Ease of Fix (The "Low Hanging Fruit")

If two weaknesses have the same impact, but one can be fixed by changing a single configuration line while the other requires a complete architectural rewrite, fix the easy one first to reduce the overall "attack surface" quickly.
