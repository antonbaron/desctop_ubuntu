#!/bin/bash
websockify --web /usr/share/novnc $PORT localhost:5900 --log-file /var/log/websockify.log
