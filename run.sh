#!/bin/bash
sed -i "s~<<EXTURL>>~$EXTURL~g" /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js
set -ex
exec supervisord -c /system/supervisord.conf
