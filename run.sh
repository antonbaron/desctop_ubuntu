#!/bin/bash
sed -i "s~<<EXTURL>>~$EXTURL~g" /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js
sed -i "s~<<INTURL>>~$INTURL~g" /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js
sed -i "s~<<EXTURL>>~$EXTURL~g" /.config/falkon/profiles/default/settings.ini
sed -i "s/<<MACHINEID>>/`cat /etc/machine-id`/g" /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js

set -ex
exec supervisord -c /system/supervisord.conf
