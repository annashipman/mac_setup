# Setting up a new Mac

For use with [suited](https://github.com/norm/suited).

## Manual steps before `suited`

1. [Install and set up 1Password](/docs/1Password_setup.md)

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


2. Add it to GitHub. (Can also add it to Bitbucket as well while we're here).

To get it to the clipboard: `cat ~/.ssh/id_rsa.pub | pbcopy`.

3. Run suited initial set-up. (This will also check out the `mac_setup` repo.

```bash
curl -O https://raw.githubusercontent.com/norm/suited/master/suited.sh
bash suited.sh github:annashipman/mac_setup:initial_setup.conf
```

## Subsequent use of `suited` and rest of setup

After installing:

Move to the `mac_setup` directory.

Run the rest of the setup:

```
MACOS_DEFAULTS_DIR=./macos/deafults suited main.conf
```

Notes:

VirtualBox will require approval and re-running of the script [because it installs a kernel extension](https://developer.apple.com/library/content/technotes/tn2459/_index.html).

You will need to log out and back in to see some of the Mac settings change.

## Installing Ruby

This is a separate script as it takes AGES. Do when you're about to make a cup of tea.

```
suited ruby.conf
```


## Manual steps after `suited`

1. Move `FileVault Recovery Key.txt` from desktop to somewhere safe.

1. Update github email address in `.gitconfig`.

1. Set caps lock to control (System prefs -> keyboard -> Modifier keys)

1. Remap external keyboard keys (caps lock -> control, alt -> apple, apple -> alt)

1. Set tap to click (System prefs -> keypad)

1. Set up notes, calendar, reminders to sync (System Preferences -> iCloud -> uncheck the things then select the things I want to synch. (Messages is automatic.))

1. Notes: File -> Preferences -> Order by title

1. Stop notifications (System Preferences -> Notifications -> Do Not Disturb from 00:00 to 23:59). There is a display bug that means this doesn't show up in System prefs but does if you look in the notifications menu (top right of screen).

1. Install [1Password browser extensions](https://agilebits.com/onepassword/extensions).

1. Stop Firefox showing recently visited pages (3 bar menu -> Preferences -> When Firefox starts: show your homepage: https://start.duckduckgo.com/) and on new tabs (there is a settings cog on new tabs).

1. Stop Firefox offering to remember passwords (3 bar menu -> Preferences -> Privacy and security -> Forms and passwords make sure "remember logins and passwords for sites" is unchecked.) Also, [set default search to DuckDuckGo](about:preferences#search).

1. Stop Chrome offering to remember passwords (Three dots menu -> Advanced (very bottom of page) -> Passwords and forms -> Manage passwords - make sure it is off).

1. Set iTerm to the right size (iTerm2 -> Preferences -> Profiles -> Default -> Window -> Columns: 170, Rows: 42)

1. Install FireFTP: - go to [http://fireftp.net/](http://fireftp.net) in Waterfox -> Download -> Add to Firefox [sic]

1. Block Twitter in `/etc/hosts` (can be commented out of course):

```
127.0.0.1  https://twitter.com
127.0.0.1  twitter.com
```
