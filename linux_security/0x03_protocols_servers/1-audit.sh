#!/bin/bash
CONFIG_FILE="/etc/ssh/sshd_config"
grep -Eh '^\s*[^#]' $CONFIG_FILE /etc/ssh/sshd_config.d/*.conf 2>/dev/null
