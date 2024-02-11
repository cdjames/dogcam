# SSH setup
The following instructions will configure SSH access to the Raspberry PI using security keys instead of a password.

[Original instructions](https://www.raspberrypi.com/documentation/computers/remote-access.html#passwordless-ssh-access)

**On local machine**
1. Generate a key   
    - `ssh-keygen`
2. Copy the public data to PI
    - `cat ~/.ssh/<KEYNAME>.pub | ssh <USERNAME>@<IP-ADDRESS> 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'`
3. Add key to keychain (macOS)
    - `ssh-add --apple-use-keychain ~/.ssh/<PATH_TO_PRIVATE_KEY>`
4. Add nickname to local ~/.ssh/config
```bash
cat >> ~/.ssh/config << EOF
Host rpi
  HostName <IP>
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/<PATH_TO_PRIVATE_KEY>
EOF
```
5. Connect to PI
    - `ssh rpi`

**On PI**
1. Edit sshd_config to disallow password logins by change *PasswordAuthentication*, *ChallengeResponseAuthentication*, and *UsePAM* to "no"
```bash
sudo sed -i -E 's/#? *(PasswordAuthentication) (yes|no)/\1 no/;s/#? *(ChallengeResponseAuthentication) (yes|no)/\1 no/;s/#? *(UsePAM) (yes|no)/\1 no/' /etc/ssh/sshd_config
```

2. Double check
```bash
cat /etc/ssh/sshd_config | \
grep -E 'PasswordAuthentication no|ChallengeResponseAuthentication no|UsePAM no'
```