# LLM LXC Playbook

This playbook creates and provisions the Strix Halo vLLM LXC on Proxmox.

## Prerequisite

Run `../proxmox-bootstrap` first and reboot the host if kernel params changed.

## What it does

- Creates the LXC container with configured CPU/RAM/disk/storage
- Adds `/dev/dri` and `/dev/kfd` passthrough
- Installs podman/git in-container
- Clones toolbox repo and pulls vLLM container image
- Installs `run-vllm` helper script

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/llm-lxc
ansible-playbook site.yml
```

## Defaults and Overrides

- VMID: `100`
- Hostname: `vllm`
- Disk: `64GB`
- Storage: `local-lvm`

Base defaults live in `group_vars/all.yml`.
Host-specific overrides live in `host_vars/<inventory-host>.yml` (for this node: `host_vars/pve.yml`).

## Current Host Override (`pve`)

- Cores: `32`
- Memory: `114688` MB
- Disk: `128` GB
- Storage: `nvme2-lvmthin`

## Verify

```bash
pct status 100
pct enter 100
run-vllm shell
```
