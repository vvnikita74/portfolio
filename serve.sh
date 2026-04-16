#!/usr/bin/env bash
# Запуск из папки «Халтурка»: отдаёт portfolio_landing.html и все папки (SST, art-direction и т.д.).
# Телефон в той же Wi‑Fi: откройте выведенный ниже URL в браузере.

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"
PORT="${PORT:-8080}"

echo "Корень: $DIR"
echo "Этот компьютер: http://127.0.0.1:$PORT/portfolio_landing.html"
if IP=$(ipconfig getifaddr en0 2>/dev/null); then
  echo "Телефон (Wi‑Fi): http://${IP}:$PORT/portfolio_landing.html"
elif IP=$(ipconfig getifaddr en1 2>/dev/null); then
  echo "Телефон (Wi‑Fi): http://${IP}:$PORT/portfolio_landing.html"
fi
echo "Останов: Ctrl+C"
exec python3 -m http.server "$PORT"
