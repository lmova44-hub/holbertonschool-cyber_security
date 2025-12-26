#!/bin/bash

whois "$1" | awk -F': +' '
/^(Registrant|Admin|Tech)/ {
    gsub(/^ +| +$/, "", $2)         # value-dən baş və son boşluqları sil
    field=$1
    value=$2
    if(field ~ /Street$/) value=" "value" "
    if(field ~ /Phone Ext|Fax Ext/ && value=="") value=""
    print field", "value
}' > "$1.csv"
