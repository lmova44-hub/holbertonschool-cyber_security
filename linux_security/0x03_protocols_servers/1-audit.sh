#!/bin/bash
grep -E '^(Include|PasswordAuthentication)' /etc/ssh/sshd_config

for f in /etc/ssh/sshd_config.d/*.conf 2>/dev/null; do
    grep -E '^(Include|PasswordAuthentication)' "$f"
done
