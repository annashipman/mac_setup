# Setting up a new Mac

For use with [suited](https://github.com/norm/suited).

## Manual steps before `suited`

1. [Install and set up 1Password](/docs/1Password_setup.md)

## Installing `suited` and initial setup

1. Create a new SSH key for the new device and add it to the ssh-agent.

```
ssh-keygen -trsa -b4096 -C "$GIT_EMAIL" -f ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
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

3. Check whether you want full disk encryption (probably yes for own computer, no for shared computer, see [this commit](https://github.com/annashipman/mac_setup/commit/3e3edf3))

4. Run suited initial set-up. (This will also check out the `mac_setup` repo.)

```bash
curl -O https://raw.githubusercontent.com/norm/suited/master/suited.sh
bash suited.sh github:annashipman/mac_setup:initial_setup.conf
```

## Subsequent use of `suited` and rest of setup

After installing:

Move to the `mac_setup` directory.

Run the rest of the setup:

```
MACOS_DEFAULTS_DIR=./macos/defaults suited main.conf
```

Notes:

You will need to log out and back in to see some of the Mac settings change.

## Manual steps after `suited`

1. Go to settings, security, turn off FileVault and then turn it on again and allow apple ID to unlock it.

1. Set iTerm to the right size (iTerm2 -> Settings -> Profiles -> Default -> Window -> Columns: 170, Rows: 42). Also, set Working directory to 'Reuse previous session's directory' (in General tab under Default profile) and turn off the bell for events such as auto-completion not available (In Terminal tab under Default profile -> Notifications -> Silence bell)

1. Update github email address in `.gitconfig`.

1. Set default shell back to bash. `chsh -s /bin/bash`

1. Set caps lock to control (System settings -> keyboard -> keyboard shortcuts -> Modifier keys)

1. Add a shortcut for strikethrough (System settings -> Keyboard -> Shortcuts tab -> App Shortcuts -> + -> ⇧⌘X)

1. Set up notes, calendar, reminders to sync (System settings -> iCloud -> uncheck the things then select the things I want to synch. (Messages is automatic.))

1. Notes: View -> Sort by -> Title

1. Install Things from the Mac App store (go to my account, change who purchsed by) and log in (Things -> settings -> Things Cloud). Set it not to display number of items (settings -> General -> Badge count).

1. Stop notifications (System settings -> Focus -> Do Not Disturb -> Set a schedule -> from 00:00 to 23:59).

1. Stop interface sounds (System settings -> Sounds -> uncheck interface sounds). This could probably be automated but I don't have time to figure out how right now.

1. Install [1Password browser extensions](https://agilebits.com/onepassword/extensions).

1. Stop Firefox showing recently visited pages (3 bar menu -> settings -> Home, update Homepage and New tabs).

1. Stop Firefox offering to remember passwords (3 bar menu -> settings -> Privacy and security -> Forms and passwords make sure "Ask to save logins and passwords for sites" is unchecked.)

1. Set default search to DuckDuckGo: [about:preferences#search](about:preferences#search).

1. Stop Chrome offering to remember passwords (Three dots menu -> Settings -> Passwords -> Unselect "Offer to save passwords"

1. Set up my server. Put config into the `~/.ssh/config` file (required config is in 1Password). Copy the new public key ( `cat ~/.ssh/id_rsa.pub | pbcopy` ), SSH to the machine as root and paste the new public key into Puppet, and then run puppet (`puppet apply -v puppet/annajunior.pp`). Note: need to remove entire comment at the end as Puppet doesn't like the whitespace.

1. Add SSH key to Bitbucket (profile is hidden at the bottom left).

1. Copy over required files from old computer: `Pictures`, `Movies`, in progress stuff in `projects` and if relevant, `Desktop`.

1. Install backblaze. Can brew install --cask, but it downloads an installer that you then have to open, so this is a manual step, for now. Also set up Time MAchine back ups.

1. Finally, install Ruby. This is a separate script as it takes AGES. Do when you're about to make a cup of tea.

```
suited ruby.conf
```

## When connected to external keyboard

1. Remap external keyboard keys (caps lock -> control, alt [option] -> apple [command], apple -> alt)

## Optional

1. Install Xcode - this can be done in the Brewfile but takes a long time so better to do manually via the AppStore when needed.
