# Raspberry PI setup
Follow the instructions to set up your Raspberry PI OS image and flash it to an SD card.

**Prerequisites**
- macOS on local machine (tested with Sonoma, using zsh shell)
- [Homebrew](https://brew.sh) installed (recommended)
- openssl installed (`brew install openssl`)
- Micro SD card and reader

1. Create a *userconf.txt* file with [create-userconf.sh](./create-userconf.sh)
    - `sh create-userconf.sh <USERNAME> <PASSWORD>`
2. Copy *userconf.txt* to root of [2023-12-05-raspios-bullseye-armhf-lite.img](./2023-12-05-raspios-bullseye-armhf-lite.img.xz). [Original link](https://downloads.raspberrypi.com/raspios_oldstable_armhf/images/raspios_oldstable_armhf-2023-12-06/2023-12-05-raspios-bullseye-armhf.img.xz?_gl=1*16sb5tw*_ga*NDA5MDgwNTk5LjE3MDUyNDUzNzk.*_ga_22FD70LWDS*MTcwNzAxNDczOC41LjEuMTcwNzAxNDc1NS4wLjAuMA..)
    1. Decompress
    2. Mount
    3. Copy the file
3. Edit [wpa_supplicant.conf](./wpa_supplicant.conf) to replace "ssid" and "psk" with your WiFi network's information.
4. Copy [wpa_supplicant.conf](./wpa_supplicant.conf) to root of [2023-12-05-raspios-bullseye-armhf-lite.img](./2023-12-05-raspios-bullseye-armhf-lite.img.xz)
5. Take the diff of [config.txt](./config.txt) and the same file in the root of [2023-12-05-raspios-bullseye-armhf-lite.img](./2023-12-05-raspios-bullseye-armhf-lite.img.xz); copy the missing lines to the image's file.
6. Use command in [flash-bullseye.sh](./flash-bullseye.sh) to flash [2023-12-05-raspios-bullseye-armhf-lite.img](./2023-12-05-raspios-bullseye-armhf-lite.img.xz) to your SD card.
7. Insert the SD card into the PI and boot it up.

[Next steps](../camera-setup/readme.md)