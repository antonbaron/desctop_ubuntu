#!/bin/bash
sed -i "s~<<EXTURL>>~$EXTURL~g" /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js
sed -i "s~<<EXTURL>>~$EXTURL~g" /.config/falkon/profiles/default/settings.ini
set -ex
exec supervisord -c /system/supervisord.conf
