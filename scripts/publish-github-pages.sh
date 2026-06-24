#!/usr/bin/env bash
set -euo pipefail

OWNER="${1:-}"
REPO="${2:-builder-taker-civilizational-dynamics}"
VISIBILITY="${3:-public}"

if [[ -z "$OWNER" ]]; then
  echo "Usage: $0 GITHUB_USERNAME [REPO_NAME] [public|private]"
  exit 1
fi

if [[ "$VISIBILITY" != "public" && "$VISIBILITY" != "private" ]]; then
  echo "Visibility must be public or private."
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI is required. Install it, then run: gh auth login"
  exit 1
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI is not authenticated. Run: gh auth login"
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init
fi

git add .
git commit -m "Create Builder-Taker Civilizational Dynamics site" || true
git branch -M main

if ! gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  gh repo create "$OWNER/$REPO" "--$VISIBILITY" --source=. --remote=origin --push
else
  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "https://github.com/$OWNER/$REPO.git"
  fi
  git push -u origin main
fi

gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  "/repos/$OWNER/$REPO/pages" \
  -f "source[branch]=main" \
  -f "source[path]=/" \
  >/dev/null 2>&1 || true

echo "Repository: https://github.com/$OWNER/$REPO"
echo "Pages URL:  https://$OWNER.github.io/$REPO/"
