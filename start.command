#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2025-2026 Flavio Pendolino
# Double-click launcher (macOS Finder; also runs from any Linux/macOS shell).
# Serves this folder on 127.0.0.1 only and opens Underline in the default browser.
# Close this window (or press Ctrl+C) to stop the server.
set -u
cd "$(dirname "$0")" || exit 1

PY="$(command -v python3 || true)"
if [ -z "$PY" ]; then
  echo "python3 not found: opening index.html directly (file://)."
  echo "Folder access and some PDF worker features may be limited in this mode."
  open index.html 2>/dev/null || xdg-open index.html
  exit 0
fi

# first free port from 8765 upwards
PORT="$("$PY" - <<'PYEOF'
import socket
for p in range(8765, 8800):
    s = socket.socket()
    try:
        s.bind(("127.0.0.1", p))
        s.close()
        print(p)
        break
    except OSError:
        s.close()
PYEOF
)"
if [ -z "$PORT" ]; then echo "No free port in 8765-8799."; exit 1; fi

URL="http://127.0.0.1:$PORT/index.html"
"$PY" -m http.server "$PORT" --bind 127.0.0.1 >/dev/null 2>&1 &
SERVER=$!
trap 'kill "$SERVER" 2>/dev/null' EXIT INT TERM HUP

sleep 1
echo "Underline running at $URL"
echo "Your books stay in the browser tab and are never uploaded."
echo "Close this window to stop."
open "$URL" 2>/dev/null || xdg-open "$URL" 2>/dev/null || echo "Open $URL in your browser."
wait "$SERVER"
