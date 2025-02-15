#!/bin/bash

# Start from 365 days ago
for i in {365..1}
do
  # Set the date for each commit (starting from 365 days ago to today)
  commit_date=$(date -d "$i days ago" +"%Y-%m-%d")
  
  # Set the GIT_AUTHOR_DATE and GIT_COMMITTER_DATE to simulate commits on past dates
  GIT_AUTHOR_DATE="$commit_date 12:00:00" GIT_COMMITTER_DATE="$commit_date 12:00:00" git commit --amend --no-edit --date "$commit_date 12:00:00" --allow-empty
  git push origin main --force
done
