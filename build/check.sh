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
for f in typst/*.typ typst/content/*.typ; do
  if grep -qP '\x00' "$f" 2>/dev/null; then echo "NUL BYTES: $f"; fail=1; fi
done
[ $fail -eq 0 ] && echo "clean"
echo "== git =="
git -C .. status --short | head -20
echo "== compile =="
bash select-mi-shebeirach.sh   # refresh Mi Shebeirach selector before compiling
[ -x /tmp/typst-bin/typst ] || bash setup.sh >/dev/null
if /tmp/typst-bin/typst compile --font-path fonts typst/shirei-shabbat-FULL.typ /tmp/check-out.pdf; then
  command -v pdfinfo >/dev/null && pdfinfo /tmp/check-out.pdf | grep Pages || echo "compiled OK"
else
  echo "COMPILE FAILED"; fail=1
fi
exit $fail
