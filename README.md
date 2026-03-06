# Nimo Strix Halo Homelab

This repository is split into two stages:

1. `proxmox-bootstrap/` - one-time host tuning after fresh Proxmox install
2. `llm-lxc/` - create and provision the vLLM LXC workload

## Suggested order

```bash
cd ~/dev/nimo-strix-halo-homelab/proxmox-bootstrap
ansible-playbook site.yml
reboot

cd ~/dev/nimo-strix-halo-homelab/llm-lxc
ansible-playbook site.yml
```
