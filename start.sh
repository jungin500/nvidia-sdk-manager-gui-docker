#!/bin/bash

sudo docker run \
	-it --rm \
	--net=host \
	--privileged \
	--ipc=host \
	-v /dev/bus/usb:/dev/bus/usb/ \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v /home/jungin500/다운로드:/home/nvidia/Downloads \
	-e DISPLAY=$DISPLAY \
	jungin500/nvidia-sdk-manager-gui
