cat *.tex | tr -s '[:space:][:punct:]' '\n' | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -nr | awk '{print $2 ": " $1}'
