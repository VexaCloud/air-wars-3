#!/usr/bin/env bash
# Reassemble AirWars3-158.data.unityweb from split parts (run once after clone)
set -e
cd "$(dirname "$0")"
OUT="AirWars3-158.data.unityweb"
if [ -f "$OUT" ]; then
  echo "Already exists: $OUT"
  ls -lh "$OUT"
  exit 0
fi
parts=(AirWars3-158.data.unityweb.part*)
if [ ${#parts[@]} -eq 0 ] || [ ! -f "${parts[0]}" ]; then
  echo "ERROR: No part files found (AirWars3-158.data.unityweb.part*)"
  exit 1
fi
echo "Joining ${#parts[@]} parts -> $OUT"
cat AirWars3-158.data.unityweb.part00 AirWars3-158.data.unityweb.part01 AirWars3-158.data.unityweb.part02 > "$OUT"
ls -lh "$OUT"
echo "Done. You can delete the .part* files if you want."
