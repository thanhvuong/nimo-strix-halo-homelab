# Proxmox Bootstrap Playbook

Initial Proxmox host configuration for Strix Halo homelab nodes.

## What it does

- Sets GRUB kernel params for large AMD unified memory:
  - `iommu=pt`
  - `amdgpu.gttsize=126976`
  - `ttm.pages_limit=32505856`
- Runs `update-grub`

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/proxmox-bootstrap
ansible-playbook site.yml
```

If prompted by the playbook, reboot the host and continue with `../llm-lxc`.
