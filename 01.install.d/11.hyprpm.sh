#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

plugins=(
  "https://github.com/Duckonaut/split-monitor-workspaces|split-monitor-workspaces"
)

title "Installing hyprpm and Hyprland plugins..."

progress "Fetching Hyprland headers (hyprpm update)"
hyprpm update

for entry in "${plugins[@]}"; do
  url="${entry%%|*}"
  name="${entry##*|}"

  if ! hyprpm list | grep -q "$name"; then
    progress "Adding $name"
    hyprpm add "$url"
  fi

  progress "Enabling $name"
  hyprpm enable "$name"
done

if exists hyprctl && [[ -n "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
  hyprctl reload >/dev/null
fi
