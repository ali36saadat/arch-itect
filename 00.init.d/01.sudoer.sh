#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

if groups "$USER" | grep -qw "wheel"; then
    progress "$USER is already in wheel group"
else
    title "Adding $USER to wheel group"
    sudo usermod -aG wheel "$USER"
    progress "Done!"
fi