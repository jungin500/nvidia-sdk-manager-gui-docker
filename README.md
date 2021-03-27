- Easily run NVIDA SDK Manager **GUI** within Ubuntu 18.04 Docker container

# instaillation
```bash
docker pull jungin500/nvidia-sdk-manager-gui:1.4.1-7402
```

# Running
- You can use your own directory or docker volume to save SDK Manager download folder (sdkm_downloads)
- You should run below command `start.sh` within Desktop Environment, or `(sdkmanager-gui:7): Gtk-WARNING **: 08:04:31.290: cannot open display: :0` (or similar) error could appear. You can `export DISPLAY=<your_desktop_id>` to workaround this issue.
```bash
#!/bin/bash
# start.sh

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
```

# Q&A or Issues
- Write down your issue to "Issue" board! I'll write find out ways to make it work, and respond ASAP. thanks.

# License
- SDK Manager: NVIDIA Corporation. (Link)[https://developer.nvidia.com/nvidia-sdk-manager]
- I am not affliated and/or sponsored from NVIDIA. It's my private work to use within Ubuntu 20.04 environment.