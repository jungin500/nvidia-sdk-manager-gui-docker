FROM ubuntu:18.04
LABEL maintainer="ji5489@gmail.com"

ENV DISPLAY=:0

COPY sdkmanager_1.4.1-7402_amd64.deb /sdkmanager.deb

RUN /bin/bash -c 'dpkg -i /sdkmanager.deb || true' && rm /sdkmanager.deb &&\
    apt-get -qq update &&\
    apt-get -qq -f -y install &&\
    apt-get -qq -y install sudo libx11-xcb1 libxtst6 libnss3 libgtk-3-0 libxss1 lsb-release &&\
    rm -rf /var/lib/apt-get/lists &&\
    useradd nvidia && echo "nvidia:nvidia" | chpasswd && adduser nvidia sudo &&\
    mkdir -p /home/nvidia/Downloads/nvidia && chown -R nvidia:nvidia /home/nvidia

USER nvidia
WORKDIR /home/nvidia

ENTRYPOINT /opt/nvidia/sdkmanager/sdkmanager-gui
