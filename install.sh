#!/usr/bin/env sh

./scripts/rm-pw.sh
./scripts/download-pw.sh
./scripts/docker-compose-up.sh
./scripts/copy-info.sh

echo "Ready. Open http://localhost"