#!/bin/bash
# Smart pager that detects CSV files and uses appropriate pager

# Read all input
input=$(cat)

# Check if the diff is for a CSV file by looking at the filename in the header
# Extract filename from lines like "--- a/path/to/file.csv" or "+++ b/path/to/file.csv"
if echo "$input" | head -5 | grep -qE '^[+-]{3} [ab]/.*\.csv$'; then
    # It's a CSV file - use less with color support for daff output
    echo "$input" | less -RFX
else
    # Not a CSV - use delta
    echo "$input" | delta
fi
