# Setting up a new Mac

For use with [suited](https://github.com/norm/suited).

## Installing `suited` and initial setup

1. Create a new SSH key for the new device and add it to the ssh-agent.

```
ssh-keygen -trsa -b4096 -C "$GIT_EMAIL" -f ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa
```

2. Add it to GitHub.

To get it to the clipboard: `cat ~/.ssh/id_rsa.pub | pbcopy`.

3. Run suited initial set-up. (This will also check out the `mac_settings` repo.

```bash
curl -O https://raw.githubusercontent.com/norm/suited/master/suited.sh
bash suited.sh github:annashipman/mac_settings:initial_setup.conf
```
