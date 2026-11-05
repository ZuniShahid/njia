#!/usr/bin/env bash
# Deploy from Cloud Shell on the web-build branch: functions, hosting, Firestore indexes.
# Optional: import only the seed docs whose ids are listed in the file $1 (e.g. docs/seed-imports/<date>.txt).
# Runs detached; log in ~/deploy-prod.log.
set -euo pipefail
cd "$(dirname "$0")/.."
LIST="${1:-}"
setsid nohup bash -c "
  set -e
  git log --oneline -1
  npm ci --silent
  (cd functions && npm ci --silent)
  if [ -n '$LIST' ]; then node scripts/seed-firestore.mjs --ids \"\$(cat '$LIST')\" --dry; fi
  firebase deploy --only functions,hosting,firestore:indexes --project njia-prod --non-interactive
  if [ -n '$LIST' ]; then node scripts/seed-firestore.mjs --ids \"\$(cat '$LIST')\"; fi
  echo ALLDONE
" > ~/deploy-prod.log 2>&1 < /dev/null &
echo "started, log: ~/deploy-prod.log"
