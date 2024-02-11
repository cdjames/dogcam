#!/bin/sh

DISK= # get SD card with `diskutil list` and set here. MAKE SURE YOU HAVE THE CORRECT DISK!!!
diskutil umount $DISK # aka /dev/disk4
sudo dd of=/dev/rdisk4 if=./2023-12-05-raspios-bullseye-armhf-lite.img status=progress bs=16M