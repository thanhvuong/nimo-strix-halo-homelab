# Home Assistant OS VM Playbook

Replaces Home Assistant Core LXC `103` with Home Assistant OS VM `103` on Proxmox.

## What it does

- Stops and destroys LXC CT `103` if it exists
- Downloads Home Assistant OS qcow2 image
- Creates VM `103` with recommended baseline resources
- Imports disk to configured Proxmox storage
- Enables boot + starts VM

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/home-assistant-vm
ansible-playbook site.yml
```

## Defaults and Overrides

Base defaults: `group_vars/all.yml`
Host-specific overrides: `host_vars/<inventory-host>.yml` (this node: `host_vars/pve.yml`)

## Verify

```bash
qm status 103
qm config 103
```
