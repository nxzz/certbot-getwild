#!/bin/sh

# レコードを初期化
gcloud dns record-sets import -q --zone="${ZONE_NAME}" --delete-all-existing /dev/null

exit 0
