#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

extra_mirrors=(
    "https://linux-mirror.liara.ir/repository/arch/"
)

read -rn 1 -p "Update Mirrors? [y/N] " umirrors
echo

if [[ $umirrors =~ ^([Yy])$ ]]; then
  title "Update Mirrors"
  sudo pacman -Sy reflector --noconfirm
  sudo reflector --sort rate --latest 10 --save /etc/pacman.d/mirrorlist

  for mirror in "${extra_mirrors[@]}"; do
    echo "Server = ${mirror}\$repo/os/\$arch"
  done | sudo tee -a /etc/pacman.d/mirrorlist >/dev/null
fi

read -rn 1 -p "Sync Mirrors? [y/N] " sync
echo

if [[ $sync =~ ^([Yy])$ ]]; then
  title "Sync Mirrors"
  sudo pacman -Syu --noconfirm
fi

progress "Done!"