#!/bin/bash

# 1. Arqumentin verilib-verilmədiyini yoxla
if [ -z "$1" ]; then
    exit 1
fi

# 2. {xor} prefiksini təmizlə
encoded_string=$(echo "$1" | sed 's/^{xor}//')

# 3. Base64 decode et və hər baytı 95 (_) ilə XOR et
echo "$encoded_string" | base64 -d | perl -pe '$_ ^= "_" x length'
