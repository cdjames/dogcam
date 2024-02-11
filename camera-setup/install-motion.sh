#!/bin/sh

sudo apt-get update
sudo apt-get install motion libcamera-apps libcamera-tools
sudo chown motion /var/log/motion
sudo touch /var/log/motion/motion.log
sudo chown motion /var/log/motion/motion.log

exit 0