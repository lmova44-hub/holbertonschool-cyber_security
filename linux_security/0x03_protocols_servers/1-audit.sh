#!/bin/bash
grep -E '^(Include|PasswordAuthentication)' /etc/ssh/sshd_config | head -n 2
