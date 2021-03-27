#!/bin/bash

sudo docker run \
	-it --rm \
	--net=host \
	--privileged \
	--ipc=host \
	-v /dev/bus/usb:/dev/bus/usb/ \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v $(pwd)/sdkm_downloads:/home/nvidia/Downloads/nvidia/sdkm_downloads \
	-e DISPLAY=$DISPLAY \
	jungin500/nvidia-sdk-manager-gui:1.4.1-7402
