#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages
dnf5 install -y \
    tmux \
    htop \
    fastfetch \
    cowsay \
    fortune-mod \
    figlet \
    lolcat \
    gnome-tweaks \
    gnome-extensions-app

#### Enable useful services
systemctl enable podman.socket

# Create a fun motd / welcome message (Papaya Whip vibes)
cat > /etc/motd << 'MOTD'
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   ██████╗  █████╗ ███╗   ███╗██╗ █████╗ ███╗   ██╗ ██████╗   ║
║   ██╔══██╗██╔══██╗████╗ ████║██║██╔══██╗████╗  ██║██╔═══██╗  ║
║   ██║  ██║███████║██╔████╔██║██║███████║██╔██╗ ██║██║   ██║  ║
║   ██║  ██║██╔══██║██║╚██╔╝██║██║██╔══██║██║╚██╗██║██║   ██║  ║
║   ██████╔╝██║  ██║██║ ╚═╝ ██║██║██║  ██║██║ ╚████║╚██████╔╝  ║
║   ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝   ║
║                                                              ║
║          Inspired by the legendary Damian Whitehouse         ║
║                 (and his best mate, Putin)                   ║
║                                                              ║
║              Official colour: Papaya Whip #FFEFD5            ║
║                                                              ║
║   "The best teachers teach from the heart, not from the book"║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
MOTD

# dconf defaults: Papaya Whip accent + DamianOS cursor + default wallpaper
mkdir -p /etc/dconf/db/local.d
cat > /etc/dconf/db/local.d/00-damianos << 'DCONF'
[org/gnome/desktop/background]
picture-uri='file:///usr/share/backgrounds/damianos/damian-and-putin-train.png'
picture-uri-dark='file:///usr/share/backgrounds/damianos/damian-and-putin-train.png'
picture-options='zoom'
primary-color='#FFEFD5'
secondary-color='#FFEFD5'

[org/gnome/desktop/screensaver]
picture-uri='file:///usr/share/backgrounds/damianos/papaya-whip-damian.png'
primary-color='#FFEFD5'

[org/gnome/desktop/interface]
cursor-theme='DamianOS'
accent-color='orange'
DCONF

dconf update || true

echo "DamianOS build complete!"
echo "  Official colour : Papaya Whip (#FFEFD5)"
echo "  Wallpapers      : /usr/share/backgrounds/damianos/  (incl. Papaya Whip pack)"
echo "  Icons / Cursors : DamianOS theme"
echo "  Default wallpaper: Damian & Putin on the train"
