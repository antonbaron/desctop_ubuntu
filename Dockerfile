FROM ubuntu:20.10
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y --no-install-recommends \
    dbus-x11 nano sudo bash net-tools \
    novnc x11vnc xvfb \
    zip unzip supervisor curl git wget ssh terminator \
    xfce4 \
    gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel \
    gnome-session gdm3 tasksel \
    gedit \
    falkon

RUN apt-get autoclean
RUN apt-get autoremove

RUN mkdir -p /.config/falkon/profiles/default/extensions/greasemonkey
COPY falkon.ini /.config/falkon/profiles/default/settings.ini
COPY default.user.js /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js
RUN sed -i "s/<<MACHINEID>>/`cat /etc/machine-id`/" /.config/falkon/profiles/default/extensions/greasemonkey/default.user.js

RUN mkdir -p /.config/autostart
COPY falkon.desktop /.config/autostart
RUN chmod +x /.config/autostart/falkon.desktop

COPY nov.zip /nov.zip

COPY . /system
RUN unzip /nov.zip
RUN cp -r /novnc/ /usr/share/
RUN mv /usr/share/novnc/vnc_lite.html /usr/share/novnc/ignO.1
RUN mv /usr/share/novnc/vnc.html /usr/share/novnc/index.html
RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/run.sh

CMD ["/system/run.sh"]
