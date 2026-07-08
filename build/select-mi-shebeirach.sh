#!/usr/bin/env bash
# Regenerate the (gitignored) Mi Shebeirach selector: prefer the private
# licensed setting when present, else the committed public placeholder.
set -euo pipefail
cd "$(dirname "$0")"
if [ -f typst/content/mi-shebeirach-local.typ ]; then
  printf '#include "mi-shebeirach-local.typ"\n' > typst/content/mi-shebeirach.typ
else
  printf '#include "mi-shebeirach-placeholder.typ"\n' > typst/content/mi-shebeirach.typ
fi
