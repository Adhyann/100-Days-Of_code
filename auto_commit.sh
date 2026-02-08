#!/bin/bash

# Total number of days
total=100

# Get all files sorted
files=(*)

# Loop through files
for ((i=0; i<total && i<${#files[@]}; i++)); do
    file="${files[$i]}"

    # Only add if it's a file
    if [ -f "$file" ]; then
        git add "$file"

        # Calculate days ago (oldest first)
        days_ago=$((total - i - 1))

        # Safe date format (works in Git Bash)
        commit_date=$(date -d "$days_ago days ago" +"%Y-%m-%dT12:00:00")

        export GIT_AUTHOR_DATE="$commit_date"
        export GIT_COMMITTER_DATE="$commit_date"

        git commit -m "DSA Challenge - Day $((i+1))"
    fi
done

echo "✅ All commits created successfully!"
