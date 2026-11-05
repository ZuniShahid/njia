#!/usr/bin/env bash
# Deploy from Cloud Shell on the web-build branch: functions, hosting, Firestore indexes, then
# import only the seed docs listed in $1 (default: today's list). Runs detached; log in ~/deploy-prod.log.
set -euo pipefail
cd "$(dirname "$0")/.."
LIST="${1:-docs/seed-imports/2026-11-05-new-routes.txt}"
setsid nohup bash -c "
  set -e
  git log --oneline -1
  npm ci --silent
  (cd functions && npm ci --silent)
  IDS=\$(cat '$LIST')
  node scripts/seed-firestore.mjs --ids \"\$IDS\" --dry
  firebase deploy --only functions,hosting,firestore:indexes --project njia-prod --non-interactive
  node scripts/seed-firestore.mjs --ids \"\$IDS\"
  echo ALLDONE
" > ~/deploy-prod.log 2>&1 < /dev/null &
echo "started, log: ~/deploy-prod.log"
