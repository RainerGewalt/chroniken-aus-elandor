#!/usr/bin/env bash
# Erzeugt aus einem Original-Cover (PNG/JPEG, z. B. 1536x1024) die Varianten,
# die die Seite ausliefert:
#
#   <name>-480.webp   kleine Karten und Handys
#   <name>-960.webp   Karten auf großen Bildschirmen, Tablets
#   <name>.webp       volle Breite (max. 1536 px) für die Märchen-Seite
#   <name>.jpg        Fallback und Vorschaubild für Social Media (max. 1200 px)
#
# Aufruf:  scripts/optimize-images.sh assets/images/covers/neues-maerchen.png
# Danach im Front Matter eintragen:  cover_image: /assets/images/covers/neues-maerchen.jpg
# Das Original wird nicht ausgeliefert und kann danach gelöscht werden.
#
# Benötigt ImageMagick mit WebP-Unterstützung (convert).
set -euo pipefail

if [ "$#" -eq 0 ]; then
  echo "Aufruf: $0 <bild> [<bild> ...]" >&2
  exit 1
fi

for src in "$@"; do
  base="${src%.*}"
  tmpdir="$(mktemp -d)"
  tmp="$tmpdir/src.png"
  # Erst in ein temporäres PNG kopieren, damit das Original auch dann sicher
  # bleibt, wenn es schon <name>.jpg heißt.
  convert "$src" -strip "$tmp"

  convert "$tmp" -resize '480x>'  -quality 78 -define webp:method=6 "${base}-480.webp"
  convert "$tmp" -resize '960x>'  -quality 78 -define webp:method=6 "${base}-960.webp"
  convert "$tmp" -resize '1536x1536>' -quality 80 -define webp:method=6 "${base}.webp"
  convert "$tmp" -resize '1200x1200>' -sampling-factor 4:2:0 -interlace Plane -quality 82 "${base}.jpg"

  rm -rf "$tmpdir"
  echo "$src -> ${base}{-480.webp,-960.webp,.webp,.jpg} ($(identify -format '%wx%h' "${base}.webp"))"
done
