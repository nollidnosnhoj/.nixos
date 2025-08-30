#!/usr/bin/env bash

DOWNLOAD_URL=$1

OTHER_URL=$(echo "$1" |
    sed -E 's|https://addons.mozilla.org/firefox/downloads/file/[0-9]+/([^/]+)-[^/]+\.xpi|\1|' |
    tr '_' '-' |
    awk '{print "https://addons.mozilla.org/firefox/downloads/latest/" $1 "/latest.xpi"}')

wget $OTHER_URL

unzip latest.xpi -d my-extension && pushd my-extension

cat manifest.json | jq -r '.browser_specific_settings.gecko.id'

popd
rm -rf./my-extensions
rm latest.xpi
