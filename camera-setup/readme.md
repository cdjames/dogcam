# Motion capture setup

## Setup
Follow the instructions to set up the motion capture software on the Raspberry PI.

1. Turn on the pi; find the IP of the pi via your router app or settings.
    - *Note*: At this point, you may wish to follow the instructions [here](../ssh-setup/readme.md) to configure SSH access without a password.
2. Copy the files in this directory to your home directory on the PI using `rsync`
    - Ex: `rsync -avuP <PATH TO>/camera-setup/ <USER>@<IP>:`
3. Connect to raspberry pi via `ssh`
    - Ex: `ssh <USERNAME>@<your pi's IP>`
4. Run [install-motion.sh](./install-motion.sh) to install libcamerify and [motion](https://motion-project.github.io)
    - `sudo sh install-motion.sh`
5. Run [install-libcamerify-commands.sh](./install-libcamerify-commands.sh) to install the above files on the pi
    - `sudo sh install-motion.sh`
6. Copy [motion.conf](./motion.conf) to "/etc/motion/motion.conf" on the pi
    - `sudo cp motion.conf /etc/motion`
7. Follow instructions on [tailscale](https://tailscale.com/download/linux) website to install tailscale on the pi
    - `curl -fsSL https://tailscale.com/install.sh | sh`
8. Obtain a [one-off auth key](https://tailscale.com/kb/1085/auth-keys) and follow the instructions to register the pi with an auth key
9. Use `sudo raspi-config` to set the correct timezone via "Localisation Options", or use command `sudo timedatectl set-timezone America/Detroit`
10. Use `crontab -e` to install the contents of [crontab](./crontab) in the pi's cron jobs
11. Run `sudo reboot now` to reboot and start the camera capture (you can also manually run the `libcamerify_motion` command that you installed earlier)

## Verify the installation
1. Check that motion is running: 
    - `pgrep motion`
2. Check that tailscale is running: 
    - `tailscale status`
    - `systemctl status tailscaled`

Now when you install tailscale on another device such as a phone, you can visit the tailscale "MagicDNS" for the pi to view the dogcam. 

Run the following command to get the MagicDNS name:
`tailscale status --peers=false --json | grep DNSName`

Example: *raspberrypi.tail156da.ts.net*
