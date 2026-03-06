# Dev LXC Playbook

Creates a Debian dev container (VMID 101) for Node/Bun development.

## What it does

- Creates unprivileged Debian LXC
- Installs Node.js, Bun, git, build tools, and OpenSSH

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/dev-lxc
ansible-playbook site.yml
```

## Defaults and Overrides

Base defaults: `group_vars/all.yml`
Host-specific overrides: `host_vars/<inventory-host>.yml` (this node: `host_vars/pve.yml`)

## Verify

```bash
pct status 101
pct enter 101
```
