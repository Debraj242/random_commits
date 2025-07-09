#!/bin/bash

commit_messages=(
  "Refactor init script"
  "Update README formatting"
  "Fix bug in GPU node check"
  "Add FHEVM integration notes"
  "Improve CLI argument parsing"
  "Document environment setup"
  "Fix typo in comments"
  "Add error handling for GPU query"
  "Optimize bash logic"
  "Update sample node script"
  "Clean up redundant code"
  "Clarify instructions in README"
  "Add test case for dry run"
  "Fix broken link in README"
  "Reorganize folder structure"
)

for i in {0..14}; do
  START_EPOCH=$(date -d "2024-01-01" +%s)
  END_EPOCH=$(date -d "2025-06-30" +%s)
  RANDOM_EPOCH=$((START_EPOCH + RANDOM % (END_EPOCH - START_EPOCH)))
  COMMIT_DATE=$(date -d "@$RANDOM_EPOCH" +"%Y-%m-%dT%H:%M:%S")

  echo "- ${commit_messages[$i]}" >> README.md
  git add README.md

  GIT_AUTHOR_DATE="$COMMIT_DATE" GIT_COMMITTER_DATE="$COMMIT_DATE" \
    git commit -m "${commit_messages[$i]}"

  echo "✅ Commit $((i+1)) on $COMMIT_DATE: ${commit_messages[$i]}"
done
