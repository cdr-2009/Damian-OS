# How to build a DamianOS ISO

You **cannot** build a full bootable ISO inside this chat sandbox — a real Fedora/Bluefin image is several GB and needs GitHub Actions (or a powerful local machine with podman + bootc-image-builder).

Follow these steps:

## 1. Push DamianOS to GitHub

```bash
# Create a new empty repo on GitHub named "damianos", then:
unzip damianos.zip
cd damianos
git init
git add .
git commit -m "DamianOS initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/damianos.git
git push -u origin main
```

## 2. One-time setup

1. **Enable Actions**  
   Repo → Actions tab → enable workflows.

2. **Cosign signing key** (required or the container build fails):
   ```bash
   COSIGN_PASSWORD="" cosign generate-key-pair
   # Settings → Secrets and variables → Actions → New secret
   # Name: SIGNING_SECRET
   # Value: paste contents of cosign.key
   ```

3. **Edit identity files** (replace `YOUR_GITHUB_USERNAME`):
   - `image-template.env` → `REPO_ORGANIZATION="YOUR_GITHUB_USERNAME"`
   - `disk_config/iso.toml` → change the `bootc switch` line to:
     ```
     bootc switch --mutate-in-place --transport registry ghcr.io/YOUR_GITHUB_USERNAME/damianos:latest
     ```

4. Commit & push those two file changes.

## 3. Build the container image first

- Go to **Actions** → **Build container image** (or wait for the push to trigger it).
- Wait until it finishes successfully (green check).  
  Your image is now at: `ghcr.io/YOUR_USERNAME/damianos:latest`

## 4. Build the ISO

1. Actions → **Build disk images**
2. Click **Run workflow**
3. Choose platform: **amd64** (or arm64)
4. Leave “Upload to S3” unchecked unless you configured S3 secrets
5. Run workflow

When it finishes, download the **artifact** — it will contain an `.iso` (Anaconda installer) you can flash with Ventoy, Rufus, `dd`, etc.

## Alternative: install without an ISO

If you already have any bootc system (Bluefin, Bazzite, Aurora, Fedora Atomic):

```bash
sudo bootc switch ghcr.io/YOUR_USERNAME/damianos:latest
sudo systemctl reboot
```

No ISO needed.

## Local build (advanced)

On a machine with lots of disk + RAM:

```bash
just build
just build-iso
```

See the main README and the upstream [image-template](https://github.com/ublue-os/image-template) docs for details.
