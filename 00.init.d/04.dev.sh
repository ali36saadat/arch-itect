#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

dev=(
  acpi
  alsa-utils
  autoconf
  automake
  binutils
  curl
  dosfstools
  file
  findutils
  fzf
  gawk
  gcc
  git
  go
  grep
  gzip
  less
  lm_sensors
  make
  neovim
  patch
  pkgconf
  python
  python-pip
  rsync
  sed
  sudo
  unrar
  unzip
  wget
  which
  xdg-user-dirs
  xdg-utils
  zip
  zsh
  uv
  tree
  # shellcheck
  # shfmt
  # rustup
  # rlwrap
  # perl-rename
  # net-tools
  # nmap
  # ntp
  # mtools
  # inxi
  # jq
  # git-delta
  # github-cli
  # fx
  # entr
  # fd
  # bind-tools
)

title "Installing dev packages..."

sudo pacman -S --needed base-devel

for pkg in "${dev[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  sudo pacman -Sq "$pkg" --noconfirm >/dev/null
done
