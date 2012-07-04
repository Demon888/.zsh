# Make directory and immediately change into it
mdc()    { mkdir -p "$1" && cd "$1" }

# List the 10 longest files (by line count) in a directory from longest to shortest
wcld() { wc -l $1/**/* 2>/dev/null | sort -nr | head -n10 }
