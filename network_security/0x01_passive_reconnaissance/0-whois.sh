#!/bin/bash

whois "$1" | awk -F': +' '
/^(Registrant|Admin|Tech)/ {
    field=$1
    value=$2
    # Street sahəsi üçün əlavə space
    if(field ~ /Street$/) value=" "value" "
    # boş Ext sahələri üçün ":" saxla
    if(field ~ /Phone Ext|Fax Ext/ && value=="") value=""
    # Header-ləri birinci sətrdə toplamaq
    headers = headers ? headers", "field : field
    # Value-ləri ikinci sətrdə toplamaq
    values = values ? values", "value : value
}
END {
    print headers
    print values
}' > "$1.csv"
