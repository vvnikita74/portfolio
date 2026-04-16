#!/usr/bin/env bash
# Запуск из папки «Халтурка»: отдаёт index.html и все папки с ассетами.
# Телефон в той же Wi‑Fi: откройте выведенный ниже URL в браузере.

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
PORT="${PORT:-8080}"

echo "Корень: $DIR"
echo "Этот компьютер: http://127.0.0.1:$PORT/"
if IP=$(ipconfig getifaddr en0 2>/dev/null); then
  echo "Телефон (Wi‑Fi): http://${IP}:$PORT/"
elif IP=$(ipconfig getifaddr en1 2>/dev/null); then
  echo "Телефон (Wi‑Fi): http://${IP}:$PORT/"
fi
echo "Останов: Ctrl+C"
exec python3 -m http.server "$PORT"
