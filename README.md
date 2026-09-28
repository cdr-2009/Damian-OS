# DamianOS

**A custom Universal Blue (bootc) image inspired by the legendary teacher Damian Whitehouse — and his best mate, Putin.**

> "The best teachers teach from the heart, not from the book."

DamianOS is a friendly, polished desktop experience based on [Bluefin](https://projectbluefin.io/), packed with wallpapers, icons, a custom cursor featuring Damian's face, and the official colour **Papaya Whip** (`#FFEFD5`).

![Damian & Putin](system_files/usr/share/backgrounds/damianos/damian-and-putin-train.png)

---

## What's included?

- **Base**: Bluefin (GNOME + excellent defaults)
- **Official colour: Papaya Whip** (`#FFEFD5`) — solid, gradient & Damian logo wallpapers
- **16+ wallpapers** of Damian (portrait, AI variants, bus stop, Leeds station, baby Damian, curly-mustache Damian, and of course **Damian + Putin on the train**)
- **Custom cursor theme** (`DamianOS`) — the pointer is Damian's face
- **Circular face icons** of Damian and Putin
- Extra packages: `tmux`, `htop`, `neofetch`, `cowsay`, `fortune`, `figlet`, `lolcat`, GNOME Tweaks
- Custom MOTD + login welcome message
- Default wallpaper set to the iconic Damian & Putin train photo

---

## How to use this repository

### 1. Create your own repo

Push this folder to a new GitHub repository (or use it as a template).

### 2. Initial setup

```bash
git clone https://github.com/YOUR_USERNAME/damianos.git
cd damianos

# Generate cosign key pair (required for image signing)
COSIGN_PASSWORD="" cosign generate-key-pair
```

- Add the contents of `cosign.key` as a GitHub Actions secret named `SIGNING_SECRET`
- **Never commit `cosign.key`!**

### 3. Customize the identity

Edit `image-template.env`:

```env
IMAGE_NAME=damianos
REPO_ORGANIZATION="YOUR_GITHUB_USERNAME"   # ← change this!
```

### 4. Commit & push

```bash
git add .
git commit -m "DamianOS with full wallpaper + cursor pack"
git push
```

Watch the **Actions** tab — your image will appear at:

```
ghcr.io/YOUR_USERNAME/damianos:latest
```

### 5. Switch to DamianOS

```bash
sudo bootc switch ghcr.io/YOUR_USERNAME/damianos:latest
```

Reboot and enjoy Damian (and Putin) everywhere.

---

## Building an ISO

A full installable `.iso` is produced by the **Build disk images** GitHub Action after your container image has been built.

See **[HOW-TO-BUILD-ISO.md](HOW-TO-BUILD-ISO.md)** for step-by-step instructions.

Quick path if you already run Bluefin/Bazzite/Aurora:

```bash
sudo bootc switch ghcr.io/YOUR_USERNAME/damianos:latest
```

## Customizing further

- **Add packages** → edit `build_files/build.sh`
- **Add more wallpapers / icons** → drop files into `system_files/usr/share/backgrounds/damianos/` or `.../pixmaps/damianos/`
- **Change base image** → edit the `FROM` line in `Containerfile`

---

## Credits

- Template: [ublue-os/image-template](https://github.com/ublue-os/image-template)
- Inspired by: **Damian Whitehouse** — teacher, mentor, legend
- Special guest: **Vladimir Putin** (best mate)
- Base: [Project Bluefin](https://projectbluefin.io/) / Universal Blue

Made with ❤️, a bit of classroom magic, and a first-class train ticket.
# Damian-OS
# Damian-OS
# Damian-OS
# Damian-OS
# Damian-OS
