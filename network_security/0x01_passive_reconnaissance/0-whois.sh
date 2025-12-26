#!/bin/bash
whois "$1" | awk -F': +' '
/^(Registrant|Admin|Tech)/ {
    field=$1
    value=$2
    if(field ~ /Street$/) value=" "value" "
    if(field ~ /Phone Ext|Fax Ext/ && value=="") value=""
    printf "%s, %s", field, value
    if(NR != 0) print ""
}' > "$1.csv"
