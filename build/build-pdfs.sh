#!/usr/bin/env bash
# Production build: every distribution FORM of every volume, into dist/.
#
#   bash build/build-pdfs.sh
#
# Forms per volume (applied uniformly to every entry in build/volumes.json):
#   screen  — the true-trim PDF straight from Typst (e.g. 7x10), for reading on a
#             screen or handing to a print shop.        → dist/<pdf>
#   letter  — that PDF imposed on US Letter with corner crop marks + a duplex
#             caption, for double-sided home printing.  → dist/<pdf>-print-letter.pdf
#             (build/impose_letter.py; trim is read from each page's mediabox, so
#              it is volume-agnostic. Centered ⇒ front/back align for cutting.)
#
# This is what CI runs (the build / pages / release jobs in build-siddur.yml).
# check.sh stays the fast integrity GATE; this is the shippable-artifact build.
#
# Zero-network invariant: the Typst compile uses only the vendored binary
# (setup.sh) + vendored fonts. pip is publish-support tooling for the imposition
# overlay — not part of the sanctified compile.
set -uo pipefail
cd "$(dirname "$0")"
fail=0
DIST="../dist"

echo "== toolchain =="
[ -x /tmp/typst-bin/typst ] || bash setup.sh >/dev/null

# Pick a Python that can run the Letter imposition (needs pypdf + reportlab).
#   CI / Linux : python3 has pip → install the two libs.
#   Daniel's WSL: python3 has neither pip nor the libs, but the Windows python.exe
#                 on PATH does — fall back to it (it reads /mnt/c paths fine).
IMPOSE_PY=""
if python3 -c 'import pypdf, reportlab' 2>/dev/null; then
  IMPOSE_PY=python3
elif python3 -m pip --version >/dev/null 2>&1; then
  echo "installing imposition deps (pypdf, reportlab)..."
  python3 -m pip install --quiet pypdf reportlab && IMPOSE_PY=python3
fi
if [ -z "$IMPOSE_PY" ] && command -v python.exe >/dev/null 2>&1 \
   && python.exe -c 'import pypdf, reportlab' >/dev/null 2>&1; then
  IMPOSE_PY=python.exe
fi
if [ -z "$IMPOSE_PY" ]; then
  echo "ERROR: the Letter imposition needs a Python with pypdf + reportlab." >&2
  echo "  fix: 'python3 -m pip install pypdf reportlab' (install python3-pip first" >&2
  echo "  if pip is missing), or run where such a python3/python.exe is on PATH." >&2
  exit 1
fi
echo "impose via: $IMPOSE_PY"

echo "== refresh Mi Shebeirach selector =="
bash select-mi-shebeirach.sh

echo "== fresh dist/ =="
rm -rf "$DIST" && mkdir -p "$DIST"

echo "== build every volume =="
while IFS=$'\t' read -r slug entry pdf; do
  [ -n "$slug" ] || continue
  echo "-- $slug --"
  screen="$DIST/$pdf"
  letter="$DIST/${pdf%.pdf}-print-letter.pdf"
  if /tmp/typst-bin/typst compile --font-path fonts "$entry" "$screen"; then
    echo "   screen  -> dist/$pdf"
  else
    echo "   SCREEN COMPILE FAILED"; fail=1; continue
  fi
  if "$IMPOSE_PY" impose_letter.py "$screen" "$letter" >/dev/null; then
    echo "   letter  -> dist/${pdf%.pdf}-print-letter.pdf"
  else
    echo "   IMPOSITION FAILED"; fail=1
  fi
done < <(python3 - <<'PY'
import json
for v in json.load(open("volumes.json")):
    print(f'{v["slug"]}\t{v["entry"]}\t{v["pdf"]}')
PY
)

echo "== summary =="
if command -v pdfinfo >/dev/null; then
  for f in "$DIST"/*.pdf; do
    pages=$(pdfinfo "$f" | awk '/Pages/{print $2}')
    size=$(pdfinfo "$f" | awk -F': *' '/Page size/{print $2}')
    echo "   $(basename "$f") — ${pages}pp — ${size}"
  done
else
  for f in "$DIST"/*.pdf; do echo "   $(basename "$f")"; done
fi

[ $fail -eq 0 ] && echo "== OK ==" || echo "== FAILED =="
exit $fail
