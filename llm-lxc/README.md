# LLM LXC Playbook

This playbook creates and provisions the Strix Halo vLLM LXC on Proxmox.

## Prerequisite

Run `../proxmox-bootstrap` first and reboot the host if kernel params changed.

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/llm-lxc
ansible-playbook site.yml
```

## Defaults

- VMID: `100`
- Hostname: `vllm`
- Disk: `128GB`
- Storage: `nvme2-lvmthin`

Edit values in `group_vars/all.yml`.
