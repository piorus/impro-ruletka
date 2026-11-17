#!/usr/bin/env bash
# Regeneruje obrazy.js na podstawie zawartości folderu obrazy/.
cd "$(dirname "$0")"
{
  echo '// Wygenerowane przez odswiez-liste.sh'
  echo 'const OBRAZY = ['
  find obrazy -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif' \) \
    | sort | sed 's/\\/\\\\/g; s/"/\\"/g; s/.*/  "&",/'
  echo '];'
} > obrazy.js
echo "Obrazów na liście: $(grep -c '^  "' obrazy.js)"
