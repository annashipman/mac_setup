# Setting up a new Mac

For use with [suited](https://github.com/norm/suited).

## Installing `suited` and initial setup

1. Create a new SSH key for the new device and add it to the ssh-agent.

```
ssh-keygen -trsa -b4096 -C "$GIT_EMAIL" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
```

As of MacOS Sierra, you also need to modify [`~/.ssh/config`](https://help.github.com/enterprise/2.12/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/).

```
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
```


2. Add it to GitHub.

To get it to the clipboard: `cat ~/.ssh/id_rsa.pub | pbcopy`.

3. Run suited initial set-up. (This will also check out the `mac_settings` repo.

```bash
curl -O https://raw.githubusercontent.com/norm/suited/master/suited.sh
bash suited.sh github:annashipman/mac_settings:initial_setup.conf
```

## Subsequent use of `suited` and rest of setup

After installing:

Move to the `mac_settings` directory.

Run the rest of the setup:

```
MACOS_DEFAULTS_DIR=./macos/deafults suited main.conf
```

Notes:

VirtualBox will require approval and re-running of the script [because it installs a kernel extension](https://developer.apple.com/library/content/technotes/tn2459/_index.html).

You will need to log out and back in to see some of the Mac settings change.


Currently, caps lock to control and tap to click need to be set manually (the latter is set by this script but doesn't take effect - reason tbd).
