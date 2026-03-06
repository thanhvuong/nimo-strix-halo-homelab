# Nimo Strix Halo Homelab

Ansible project for bringing up a Strix Halo Proxmox homelab and deploying a local vLLM LXC.

## Layout

This repository is split into two stages:

1. `proxmox-bootstrap/` - one-time host tuning after fresh Proxmox install
2. `llm-lxc/` - create and provision the vLLM LXC workload

## Prerequisites

- Proxmox host reachable from where you run Ansible
- Ansible installed on the runner
- Inventory host alias `pve` (provided in each subproject `inventory.yml`)

## Quick Start

Use either the `Makefile` or direct `ansible-playbook` calls.

```bash
cd ~/dev/nimo-strix-halo-homelab
make bootstrap
reboot
make lxc
```

## Manual Run Order

```bash
cd ~/dev/nimo-strix-halo-homelab/proxmox-bootstrap
ansible-playbook site.yml
reboot

cd ~/dev/nimo-strix-halo-homelab/llm-lxc
ansible-playbook site.yml
```

## Configuration

- Host tuning variables: `proxmox-bootstrap/group_vars/all.yml`
- LXC defaults: `llm-lxc/group_vars/all.yml`
- Host overrides: `llm-lxc/host_vars/pve.yml`
