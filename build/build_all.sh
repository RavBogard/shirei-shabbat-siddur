#!/usr/bin/env bash
# Master build for the Phase 0 typesetting spike.
set -e
export PATH="$HOME/.local/bin:$PATH"
export OSFONTDIR="$HOME/.fonts"
FONTPATH="$HOME/.fonts"
DATE=2026-07-03
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD="$ROOT/build"
PROOFS="$ROOT/proofs"
mkdir -p "$PROOFS"
cd "$BUILD"

echo "== generate content =="
python3 emit.py >/dev/null
python3 emit_typ.py >/dev/null
python3 emit_tex.py >/dev/null

echo "== Typst =="
cd "$BUILD/typst"
for size in 6x9 7x10; do for tag in david frank; do
  typst compile --font-path "$FONTPATH" main_${size}_${tag}.typ "$PROOFS/${DATE}-typst-${tag}-${size}.pdf"
  echo "  typst ${tag} ${size} ok"
done; done
typst compile --font-path "$FONTPATH" fontsample.typ "$PROOFS/${DATE}-font-samples.pdf"
echo "  font samples ok"

echo "== XeLaTeX =="
cd "$BUILD/latex"
for size in 6x9 7x10; do for tag in david frank; do
  xelatex -interaction=nonstopmode main_${size}_${tag}.tex >/dev/null 2>&1 || true
  xelatex -interaction=nonstopmode main_${size}_${tag}.tex >/dev/null 2>&1 || true
  cp main_${size}_${tag}.pdf "$PROOFS/${DATE}-latex-${tag}-${size}.pdf"
  echo "  latex ${tag} ${size} ok"
done; done

echo "== Letter home-print impositions (David, both engines, both sizes) =="
cd "$BUILD"
for eng in typst latex; do for size in 6x9 7x10; do
  python3 impose_letter.py "$PROOFS/${DATE}-${eng}-david-${size}.pdf" \
    "$PROOFS/${DATE}-homeprint-${eng}-david-${size}-on-letter.pdf" >/dev/null
  echo "  homeprint ${eng} ${size} ok"
done; done

echo "== DONE =="
ls -1 "$PROOFS"/*.pdf | sed 's|.*/||'
