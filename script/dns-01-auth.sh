#!/bin/sh

# 現在のレコードを取得
gcloud dns record-sets export --zone="${ZONE_NAME}"  --zone-file-format /tmp/zone

# TXTレコードを追加
echo "_acme-challenge.$CERTBOT_DOMAIN. 1 IN TXT \"$CERTBOT_VALIDATION\"" >> /tmp/zone

# 変更したレコードをインポート
gcloud dns record-sets import -q --zone="${ZONE_NAME}" --zone-file-format --delete-all-existing /tmp/zone

# 反映まち
sleep 120
