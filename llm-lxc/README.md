# LLM LXC Playbook

This playbook creates and provisions the Strix Halo vLLM LXC on Proxmox.

## Prerequisite

Run `../proxmox-bootstrap` first and reboot the host if kernel params changed.

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
