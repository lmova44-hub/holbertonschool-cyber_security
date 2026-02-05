#!/bin/bash
find "$1" -perm -g=s -type f -ls 2>/dev/null
