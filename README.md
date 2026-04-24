# bootc starter

Define your OS in a `Containerfile`. Get a bootable disk image. That's it.

## Get started

**1. Use this template**

Click **"Use this template"** at the top of this page to create your repo.

**2. Make your package visible**

After your first push, go to your GitHub profile → **Packages** → find your new image → **Package settings** → **Change visibility → Public**.

> This lets your machines pull updates without any credentials.

**3. Edit the Containerfile and push**

```dockerfile
FROM quay.io/fedora/fedora-bootc:42

RUN dnf -y install vim tmux && dnf clean all
```

Add whatever packages you want. Push to `main`. GitHub Actions will build a `.qcow2` disk image automatically — find it in the **Actions** tab under **Artifacts**.

## Boot your image

```bash
qemu-system-x86_64 -m 2048 -cpu host -enable-kvm -hda bootc-disk-image.qcow2
```

## Upgrade a running machine

On any machine running your image:

```bash
sudo bootc upgrade
```

That's all. It pulls the latest container image and applies it on next boot.

---

## Want more?

- [bootc documentation](https://containers.github.io/bootc/)
- Private images, RHEL base, signing, AMI/ISO output → see [docs/going-further.md](docs/going-further.md)
