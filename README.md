# ARCH-ITECT
![ARCHITECT - Header](https://github.com/user-attachments/assets/ac52abe8-1a78-423b-a342-b355b835138f)

[Arch Linux](https://www.archlinux.org/) bootstrap scripts. Forked from [ASafaeirad - architect](https://github.com/ASafaeirad/architect)

> [!NOTE]
> **Disclaimer**: This repository is not opinionated about your dotfiles and configurations.

## Usage
1: Clone
```bash
  git clone https://github.com/Ali36Sadaat/arch-itect.git && cd arch-itect
```
2: Run Bash ( `setup.sh` is recommended )
```bash
  ./setup.sh
```
or
```bash
  ./init.sh
  ./install.sh
  ./config.sh
```

## What's included

### init.d

| script        | description                                                                                               |
| ------------- | --------------------------------------------------------------------------------------------------------- |
| `timezone`    | enables [NTP](https://wiki.archlinux.org/title/Network_Time_Protocol_daemon) and adjust the clock.        |
| `sudoer`      | add your user to `/etc/sudoers` with `NOPASSWD` param.                                                    |
| `fix-watcher` | increase max user watches on the file system to `524288`.                                                 |
| `mirrors`     | installs [reflector][reflector] and updates `/etc/pacman.d/mirrorlist`                                    |
| `dev`         | installs must have development packages.                                                                  |
| `touchpad`    | installs [xf86-input-libinput](https://wiki.archlinux.org/title/Libinput) and configure tap interactions. |
| `bluetooth`   | installs [bluez](http://www.bluez.org/)                                                                   |
| `audio`       | installs [Pipewire](https://pipewire.org/)                                                                |

### install.d

| script       | description                                                                                                                  |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| `paru`       | installs [paru][paru] [AUR helper][aur-helper].                                                                              |
| `xorg`       | installs minimal packages to run a X DE.                                                                                     |
| `packages`   | installs packages to open common file types.                                                                                 |
| `apps`       | installs common applications.                                                                                                |
| `fonts`      | installs fonts.                                                                                                              |
| `tmux`       | installs [tmux](https://github.com/tmux/tmux/) and [tpm](https://github.com/tmux-plugins/tpm).                               |
| `docker`     | installs [docker](https://www.docker.com/), [docker-compose](https://docs.docker.com/compose/), and docker credential helper |
| `omz`        | installs [oh-my-zsh](https://ohmyz.sh/), and custom plugins.                                                                 |
| `virtualbox` | installs [virtualbox](https://www.virtualbox.org//)                                                                          |

### config.d

| script  | description                                                                     |
| ------- | ------------------------------------------------------------------------------- |
| `shell` | changes default shell [zsh](https://www.zsh.org/).                              |
| `ssh`   | generates `ED25519`  [ssh](https://wiki.archlinux.org/title/Secure_Shell) keys. |
| `gpg`   | generates [gpg](https://wiki.archlinux.org/title/GnuPG) key                     |
| `npm`   | generates [npmrc](https://docs.npmjs.com/cli/v8/configuring-npm/npmrc/)         |
| `git`   | generates [git configuration](https://www.git-scm.com/docs/git-config)          |
