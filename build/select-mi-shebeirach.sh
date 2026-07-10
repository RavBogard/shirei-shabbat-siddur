#!/usr/bin/env bash
# Regenerate the (gitignored) Mi Shebeirach selector: prefer the private
# licensed setting when present, else the committed public placeholder.
set -euo pipefail
cd "$(dirname "$0")"
if [ -f typst/content/shared/mi-shebeirach-local.typ ]; then
  printf '#include "mi-shebeirach-local.typ"\n' > typst/content/shared/mi-shebeirach.typ
else
  printf '#include "mi-shebeirach-placeholder.typ"\n' > typst/content/shared/mi-shebeirach.typ
fi
