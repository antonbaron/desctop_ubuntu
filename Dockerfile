
FROM ubuntu:20.10

ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://ubuntu.mirror.rain.co.za/ubuntu/ groovy main restricted universe multiverse\n'\
'deb http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-security main restricted universe multiverse\n'\
'deb http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-updates main restricted universe multiverse\n'\
'deb http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-backports main restricted universe multiverse\n'\
'deb-src http://ubuntu.mirror.rain.co.za/ubuntu/ groovy main restricted universe multiverse\n'\
'deb-src http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-security main restricted universe multiverse\n'\
'deb-src http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-updates main restricted universe multiverse\n'\
'deb-src http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-proposed main restricted universe multiverse\n'\
'deb-src http://ubuntu.mirror.rain.co.za/ubuntu/ groovy-backports main restricted universe multiverse\n'\
'' > /etc/apt/sources.list


RUN apt-get update && apt-get install -y --no-install-recommends \
    dbus-x11 nano sudo bash net-tools \
    novnc x11vnc xvfb \
    zip unzip supervisor curl git wget g++ ssh terminator htop gnupg2 locales \
    xfce4 \
    gnome-shell ubuntu-gnome-desktop gnome-session gdm3 tasksel \
    gnome-session gdm3 tasksel \
    falkon 

RUN apt-get autoclean
RUN apt-get autoremove

RUN dpkg-reconfigure locales

COPY . /system
COPY nov.zip /nov.zip
RUN unzip /nov.zip
RUN cp -r /novnc/ /usr/share/
RUN mv /usr/share/novnc/vnc_lite.html /usr/share/novnc/ignO.1
RUN mv /usr/share/novnc/vnc.html /usr/share/novnc/index.html
RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/run.sh

CMD ["/system/run.sh"]
