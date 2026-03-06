# Proxmox Bootstrap Playbook

Initial Proxmox host configuration for Strix Halo homelab nodes.

## What it does

- Installs host utility packages:
  - `ansible` (includes `ansible-playbook`)
  - `btop`
- Adds terminal compatibility profile:
  - maps `xterm-ghostty` -> `xterm-256color` for shell sessions
- Optionally manages `/etc/network/interfaces` from template variables
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

If prompted by the playbook, reboot the host and continue with your workload stages (`../llm-lxc`, `../dev-lxc`, `../comfyui-lxc`, `../home-assistant-vm`).

## Optional Network Management

Network interface management is **disabled by default** (`network_manage_interfaces: false`) to avoid accidental host lockout.

If you want bootstrap to render `/etc/network/interfaces`:

1. Set `network_manage_interfaces: true` in `group_vars/all.yml`
2. Review and customize:
   - `network_primary_iface`
   - `network_bridge_name`
   - `network_address_cidr`
   - `network_gateway`
   - `network_extra_ifaces`
3. Optionally set `network_reload_after_apply: true` to run `ifreload -a` automatically after changes

## Verify

After reboot, confirm kernel parameters are active:

```bash
cat /proc/cmdline
```
