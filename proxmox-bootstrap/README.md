# Proxmox Bootstrap Playbook

Initial Proxmox host configuration for Strix Halo homelab nodes.

## What it does

- Installs host utility packages:
  - `ansible` (includes `ansible-playbook`)
  - `btop`
- Sets GRUB kernel params for large AMD unified memory:
  - `iommu=pt`
  - `amdgpu.gttsize=126976`
  - `ttm.pages_limit=32505856`
- Runs `update-grub`

## Files

- `site.yml` - entrypoint
- `group_vars/all.yml` - kernel parameter values
- `roles/host-setup/tasks/main.yml` - GRUB update and reboot-needed check

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/proxmox-bootstrap
ansible-playbook site.yml
```

If prompted by the playbook, reboot the host and continue with `../llm-lxc`.

## Verify

After reboot, confirm kernel parameters are active:

```bash
cat /proc/cmdline
```
