#!/bin/bash
# Race Trainer — Deploy to GitHub + Netlify
# Run this from Terminal: bash ~/Desktop/Race\ Trainer/deploy.sh

cd "$HOME/Desktop/Race Trainer" || { echo "❌ Could not find Race Trainer folder on Desktop"; exit 1; }

# Clear any stale git lock files
rm -f .git/HEAD.lock .git/index.lock .git/refs/heads/*.lock 2>/dev/null

echo ""
echo "🚀 Deploying Race Trainer..."
echo ""

git add -A

if git diff --cached --quiet; then
  echo "✅ No changes since last deploy — already up to date."
  exit 0
fi

git commit -m "Update race trainer app — $(date '+%b %d %Y, %I:%M %p')"
git push origin HEAD:main --force 2>&1

if [ $? -eq 0 ]; then
  echo ""
  echo "✅ Done! racetrainer.netlify.app will refresh in ~30 seconds."
  echo ""
else
  echo ""
  echo "❌ Push failed. Check your internet connection and try again."
  echo ""
fi
