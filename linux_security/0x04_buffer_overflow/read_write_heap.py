#!/usr/bin/python3
"""
A script that finds and replaces a string in the heap of a running process.
"""

import sys

def read_write_heap(pid, search_str, replace_str):
    # 1. /proc/[pid]/maps faylını açırıq ki, heap-in harada olduğunu tapaq
    try:
        maps_file = open(f"/proc/{pid}/maps", "r")
    except IOError as e:
        print(f"[ERROR] Can't open maps file: {e}")
        sys.exit(1)

    heap_start = None
    heap_end = None

    for line in maps_file:
        if "[heap]" in line:
            # Sətirdən ünvanları götürürük (məs: 555e646e0000-555e64701000)
            parts = line.split()
            addr_range = parts[0].split("-")
            heap_start = int(addr_range[0], 16)
            heap_end = int(addr_range[1], 16)
            break
    maps_file.close()

    if not heap_start or not heap_end:
        print("[ERROR] Could not find heap.")
        sys.exit(1)

    # 2. /proc/[pid]/mem faylını açırıq (ikili oxuma/yazma modunda)
    try:
        mem_file = open(f"/proc/{pid}/mem", "rb+")
    except IOError as e:
        print(f"[ERROR] Can't open mem file: {e}")
        sys.exit(1)

    # 3. Heap sahəsini oxuyuruq
    mem_file.seek(heap_start)
    heap_data = mem_file.read(heap_end - heap_start)

    # 4. Axtarılan mətni tapırıq
    try:
        index = heap_data.index(bytes(search_str, "ascii"))
    except ValueError:
        print(f"[ERROR] String '{search_str}' not found in heap.")
        mem_file.close()
        sys.exit(1)

    # 5. Mətni əvəz edirik
    print(f"[*] Found '{search_str}' at {hex(heap_start + index)}")
    mem_file.seek(heap_start + index)
    mem_file.write(bytes(replace_str + '\0', "ascii")) # Sonuna null byte əlavə edirik
    print(f"[*] Replaced with '{replace_str}'")

    mem_file.close()

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: read_write_heap.py pid search_string replace_string")
        sys.exit(1)
    
    read_write_heap(sys.argv[1], sys.argv[2], sys.argv[3])
