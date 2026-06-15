#!/bin/bash

# Simple Git save script for this repo

echo "Checking git status..."
git status

echo ""
echo "Adding all changes..."
git add .

echo ""
read -p "Enter commit message: " commit_message

if [ -z "$commit_message" ]; then
  echo "Commit message cannot be empty."
  exit 1
fi

echo ""
echo "Committing changes..."
git commit -m "$commit_message"

echo ""
echo "Pushing to GitHub..."
git push

echo ""
echo "Done."