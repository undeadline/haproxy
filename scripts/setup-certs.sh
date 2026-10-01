#!/usr/bin/env bash
set -euo pipefail
command -v mkcert >/dev/null || { echo "Установите mkcert: https://github.com/FiloSottile/mkcert"; exit 1; }
mkdir -p certs
mkcert -install
mkcert -cert-file certs/localhost.crt -key-file certs/localhost.key localhost 127.0.0.1 ::1
cat certs/localhost.crt certs/localhost.key > certs/localhost.pem
echo "Готово: certs/localhost.pem"