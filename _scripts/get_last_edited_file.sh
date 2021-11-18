find . -type f -printf '%T@ %p\n' | sort -n | tail -10 | cut -f2- -d" "
