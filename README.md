![image](https://user-images.githubusercontent.com/5201073/112714947-5d2eb680-8f20-11eb-8af2-4f662b41829f.png)

![image](https://user-images.githubusercontent.com/5201073/112715008-dd551c00-8f20-11eb-874e-d04d4ce3424c.png)


- Easily run NVIDA SDK Manager **GUI** within Ubuntu 18.04 Docker container
- Suitable for users who are using Other linux distros or versions (Ubuntu 20.04 and so on)

# Tested Environment
- Ubuntu 20.04 LTS (amd64)
- and so on ... (Contribution on Issue board are welcome!)

# Installation
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
- next - **Login with QR Code** and Use SDK Manager! - You can login with QR code on right top corner of login screen. currently, login browser will not appear.

# Q&A or Issues
- Write down your issue to "Issue" board! I'll write find out ways to make it work, and respond ASAP. thanks.

# License
- SDK Manager: NVIDIA Corporation. (Link)[https://developer.nvidia.com/nvidia-sdk-manager]
- I am not affliated and/or sponsored from NVIDIA. It's my private work to use within Ubuntu 20.04 environment.
