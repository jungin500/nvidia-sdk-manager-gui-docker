FROM ubuntu:18.04

ENV DISPLAY=:0

COPY sdkmanager_1.4.1-7402_amd64.deb /sdkmanager_1.4.1-7402_amd64.deb

RUN /bin/bash -c 'dpkg -i /sdkmanager_1.4.1-7402_amd64.deb || true' &&\
    sed -i "s/archive.ubuntu.com/mirror.kakao.com/g" /etc/apt/sources.list && apt-get -qq update &&\
    apt-get -qq -f -y install &&\
    apt-get -qq -y install sudo libx11-xcb1 libxtst6 libnss3 libgtk-3-0 libxss1 lsb-release &&\
    rm -rf /var/lib/apt-get/lists &&\
    useradd nvidia && echo "nvidia:nvidia" | chpasswd && adduser nvidia sudo &&\
    mkdir -p /home/nvidia && chown -R nvidia:nvidia /home/nvidia

USER nvidia
WORKDIR /home/nvidia
ENTRYPOINT /opt/nvidia/sdkmanager/sdkmanager-gui
