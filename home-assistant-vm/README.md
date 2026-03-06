# Home Assistant OS VM Playbook

Deploys Home Assistant OS as Proxmox VM `103`.

If CT `103` exists, this playbook replaces it with a VM.

## Important

- This playbook is destructive for existing CT `103` and will remove it.
- Back up/export CT `103` first if you need to preserve data or config.

## What it does

- Stops and destroys LXC CT `103` (if present)
- Downloads the Home Assistant OS `generic-x86-64` image (`.img.xz`)
- Creates VM `103` with baseline resources
- Imports the HA OS disk to configured Proxmox storage
- Configures boot, EFI disk, network, and console defaults
- Starts the VM

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/home-assistant-vm
ansible-playbook site.yml
```

## First Boot

- Open Proxmox UI -> VM `103` -> `Console` (noVNC)
- Wait for initialization to complete
- Open Home Assistant at `http://<vm-ip>:8123`

## Defaults and Overrides

Base defaults: `group_vars/all.yml`
Host-specific overrides: `host_vars/<inventory-host>.yml` (this node: `host_vars/pve.yml`)

## Verify

```bash
qm status 103
qm config 103
qm showcmd 103 --pretty
```
