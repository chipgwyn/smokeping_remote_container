#!/usr/bin/env bash

SP=$(which smokeping)

SP_MASTER="${MASTER_URL:-https://localhost/smokeping/smokeping.cgi}"
SP_SECRET="${MASTER_SECRET:-This_Is_My_Secret123}"

mkdir -p /var/smokeping/cache

echo "${SP_SECRET}" > /var/smokeping/secret.txt
chmod 600 /var/smokeping/secret.txt

SP_CMD=(${SP} --nodaemon \
              --master-url=${SP_MASTER} \
              --shared-secret="/var/smokeping/secret.txt" \
              --cache-dir="/var/smokeping/cache")

echo "My hostname is: $(hostname)"
echo "Running smokeping slave command: ${SP_CMD[@]}"

"${SP_CMD[@]}"
