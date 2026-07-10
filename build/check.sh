#!/usr/bin/env bash
# One-command integrity gate. Run after ANY edit wave, before calling work done:
#   bash build/check.sh
# 1) NUL-byte scan of all .typ sources (catches the FUSE-mount truncation failure mode)
# 2) git status summary (uncommitted churn is visible, whole-file rewrites show as huge diffs)
# 3) clean full-book compile with page count
set -uo pipefail
cd "$(dirname "$0")"
fail=0
echo "== NUL scan =="
while IFS= read -r f; do
  if grep -qP '\x00' "$f" 2>/dev/null; then echo "NUL BYTES: $f"; fail=1; fi
done < <(
  find typst -name '*.typ' 2>/dev/null
  find .. -maxdepth 1 -name '*.md' 2>/dev/null
  find ../critiques ../planning ../research ../worklog ../liturgy-map -name '*.md' 2>/dev/null
)
[ $fail -eq 0 ] && echo "clean"
echo "== git =="
git -C .. status --short | head -20
echo "== compile =="
# AR-5: compile every volume declared in build/volumes.json (currently one — the
# evening book). Per-volume page count + wall-clock, so the gate scales to N books
# with no edit. Entry/pdf paths in volumes.json are build/-relative.
bash select-mi-shebeirach.sh   # refresh Mi Shebeirach selector before compiling
[ -x /tmp/typst-bin/typst ] || bash setup.sh >/dev/null
while IFS=$'\t' read -r slug entry pdf; do
  [ -n "$slug" ] || continue
  echo "-- $slug ($entry) --"
  t0=$SECONDS
  if /tmp/typst-bin/typst compile --font-path fonts "$entry" "/tmp/check-$slug.pdf"; then
    dt=$((SECONDS - t0))
    if command -v pdfinfo >/dev/null; then
      pages=$(pdfinfo "/tmp/check-$slug.pdf" | awk '/Pages/{print $2}')
      echo "   OK — ${pages} pages, ${dt}s"
    else
      echo "   compiled OK — ${dt}s"
    fi
  else
    echo "   COMPILE FAILED"; fail=1
  fi
done < <(python3 - <<'PY'
import json
for v in json.load(open("volumes.json")):
    print(f'{v["slug"]}\t{v["entry"]}\t{v["pdf"]}')
PY
)
exit $fail
