#!/usr/bin/env bash
# One-command environment setup for any fresh sandbox. Idempotent, no network needed:
# the typst binary and every font the book uses are vendored in this repo.
#   bash build/setup.sh          → installs typst to /tmp/typst-bin/typst, fonts stay in build/fonts
# Compile with:
#   /tmp/typst-bin/typst compile --font-path build/fonts build/typst/shirei-shabbat-FULL.typ out.pdf
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p /tmp/typst-bin
if [ ! -x /tmp/typst-bin/typst ]; then
  tar -xJf tools/typst-v0.13.1-x86_64-linux-musl.tar.xz -C /tmp/typst-bin --strip-components=1
fi
# regenerate the Mi Shebeirach selector (private licensed unit if present, else placeholder)
bash select-mi-shebeirach.sh
/tmp/typst-bin/typst --version
echo "fonts: $(ls fonts | wc -l) files in $(pwd)/fonts"
echo "ready. compile (from repo root): /tmp/typst-bin/typst compile --font-path build/fonts build/typst/shirei-shabbat-FULL.typ out.pdf"
