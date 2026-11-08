#!/bin/bash
# Remote Wand site: creates the PUBLIC GitHub repo krmndigital-lab/remotewand-site from this folder,
# pushes it and turns on GitHub Pages (main branch, root). Run once:  ! bash ~/remotewand-site/publish-site.sh
set -euo pipefail
cd "$(dirname "$0")"
git add -A && git commit -q -m "site" || true
gh repo create krmndigital-lab/remotewand-site --public \
  --description "Remote Wand — privacy policy, terms, tester page and desktop companion download (no source code)" \
  --source . --remote origin --push
gh api -X POST repos/krmndigital-lab/remotewand-site/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null \
  || gh api -X PUT repos/krmndigital-lab/remotewand-site/pages -f 'source[branch]=main' -f 'source[path]=/' >/dev/null
echo "Pages: https://krmndigital-lab.github.io/remotewand-site/  (ilk yayın 1-2 dakika sürer)"
