#!/bin/bash
# External diff for git that uses daff for CSV files
# Git passes 7 parameters: path old-file old-hex old-mode new-file new-hex new-mode

path="$1"
old_file="$2"
new_file="$5"

# Exit gracefully if no files provided
[ -z "$old_file" ] || [ -z "$new_file" ] && exit 0

# Check if it's a CSV file
if [[ "$path" =~ \.csv$ ]]; then
    # Use daff for CSV files
    daff diff --color --context 1 --padding sparse "$old_file" "$new_file"
else
    # Use diff piped through delta for non-CSV files
    diff -u "$old_file" "$new_file" | delta --dark --paging=never --width="${COLUMNS:-80}"
fi
