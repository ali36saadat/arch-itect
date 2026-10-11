# Architect script

<div align="center">
  <img src="https://raw.githubusercontent.com/ASafaeirad/architect/main/resources/logo-dark.svg#gh-dark-mode-only" width="500" alt="logo">
  <img src="https://raw.githubusercontent.com/ASafaeirad/architect/main/resources/logo-light.svg#gh-light-mode-only" width="500" alt="logo">
</div>

[Arch Linux](https://www.archlinux.org/) bootstrap scripts.

> ⚠️ **Disclaimer**: This repository is not opinionated about your dotfiles and configurations.

## Usage

For a local checkout:

```bash
  $ git clone https://github.com/ASafaeirad/architect.git && cd architect
  $ ./init.sh
  $ ./install.sh
  $ ./config.sh
```

To run the setup menu directly from GitHub without cloning:

```bash
  $ bash <(curl -fsSL https://raw.githubusercontent.com/ali36saadat/arch-itect/main/setup.sh)
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
| `gpg`   | generates [gpg](https://wiki.archlinux.org/title/GnuPG) key                     |
| `git`   | generates [git configuration](https://www.git-scm.com/docs/git-config)          |
