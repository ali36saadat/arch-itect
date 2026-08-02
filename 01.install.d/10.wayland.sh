#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

audio=(
  libdbusmenu-gtk3
  playerctl
)

backlight=(
  brightnessctl
  ddcutil
)

themes=(
  matugen
  bibata-cursor-theme-bin
)

hyprland=(
  hyprland
  hyprsunset
  hypridle
  hyprpicker
  wl-clipboard
)

kde=(
  gnome-keyring
  networkmanager
)

portal=(
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
)

python=(
  gtk4
  libadwaita
  libsoup3
  libportal-gtk4
  gobject-introspection
)

quickshell=(
  cliphist
  quickshell-git
  qt6-5compat
  qt6-avif-image-plugin
  qt6-imageformats
  qt6-positioning
  qt6-svg
  qt6-translations
  qt6-wayland
  kirigami
  kdialog
)

screencapture=(
  hyprshot
  slurp
  swappy
  tesseract
  tesseract-data-eng
  wf-recorder
)

toolkit=(
  upower
  wtype
  ydotool
)

# VA-API hardware video decode. libva alone has no backend driver, so Chromium falls back
# to CPU decode. Correct config for Meteor Lake, though a controlled A/B at 720p60 AV1
# measured no power difference — the win, if any, is at higher resolutions.
video=(
  intel-media-driver # libva backend for Broadwell+ iGPUs (AV1/VP9/HEVC/H.264)
  libva-utils        # provides vainfo, to verify decode is actually available
)

widgets=(
  fuzzel
  imagemagick
  songrec
  libqalculate
  showmethekey-cli
)

packages=(
  "${audio[@]}"
  "${backlight[@]}"
  "${themes[@]}"
  "${hyprland[@]}"
  "${kde[@]}"
  "${portal[@]}"
  "${python[@]}"
  "${quickshell[@]}"
  "${screencapture[@]}"
  "${toolkit[@]}"
  "${video[@]}"
  "${widgets[@]}"
)

title "Installing wayland desktop (illogical-impulse) dependencies..."

for pkg in "${packages[@]}"; do
  progress "Installing $pkg"
  paru -Sq "$pkg" --noconfirm --needed >/dev/null
done
