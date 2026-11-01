#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025-2026 Flavio Pendolino
# Static checks for the single-file app: JS syntax, licence headers, leftover licence strings.
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0

# 1. JavaScript syntax: extract the last inline <script> block and parse it
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
python3 - "$tmp/app.js" <<'PY'
import re, sys
html = open("index.html", encoding="utf-8").read()
blocks = re.findall(r"<script>(.*?)</script>", html, re.S)
if not blocks:
    sys.exit("no inline <script> block found")
open(sys.argv[1], "w", encoding="utf-8").write(blocks[-1])
PY
node --check "$tmp/app.js" && echo "ok   JS syntax"

# 2. Licence identifiers present
for f in index.html scripts/check.sh start.command assets/icon.svg; do
  grep -q "SPDX-License-Identifier: Apache-2.0" "$f" && echo "ok   SPDX header: $f" \
    || { echo "FAIL missing SPDX Apache-2.0 header: $f"; fail=1; }
done
for f in LICENSE NOTICE README.md; do
  [ -s "$f" ] && echo "ok   present: $f" || { echo "FAIL missing: $f"; fail=1; }
done
grep -q "Apache License" LICENSE && grep -q "Version 2.0, January 2004" LICENSE \
  && echo "ok   LICENSE is Apache-2.0" || { echo "FAIL LICENSE is not Apache-2.0"; fail=1; }

# 3. Launcher and icon assets
if [ -x start.command ] && head -1 start.command | grep -q '^#!'; then echo "ok   start.command executable with shebang"
else echo "FAIL start.command missing, not executable, or no shebang"; fail=1; fi
bash -n start.command && echo "ok   start.command syntax" || { echo "FAIL start.command syntax"; fail=1; }
for f in assets/icon.svg assets/icon-512.png assets/icon-180.png assets/icon-32.png assets/social-preview.png; do
  [ -s "$f" ] && echo "ok   present: $f" || { echo "FAIL missing: $f"; fail=1; }
done

# 4. No leftover previous licence
if grep -rIl --exclude-dir=.git --exclude=CHANGELOG.md --exclude=check.sh -i "polyform" . ; then
  echo "FAIL leftover PolyForm references (files listed above)"; fail=1
else
  echo "ok   no PolyForm leftovers"
fi

exit $fail
