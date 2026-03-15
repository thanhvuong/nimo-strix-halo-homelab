# Nimo Strix Halo Homelab

Ansible project for bringing up a Strix Halo Proxmox homelab with LLM, dev, ComfyUI, and Home Assistant workloads.

## Layout

This repository is split into the following stages:

1. `proxmox-bootstrap/` - one-time host tuning after fresh Proxmox install
2. `llm-lxc/` - create and provision the vLLM LXC workload
3. `dev-lxc/` - create and provision a general dev environment LXC workload
4. `comfyui-lxc/` - create and provision a ComfyUI LXC workload
5. `postgres-lxc/` - create and provision a PostgreSQL + pgvector LXC workload
6. `home-assistant-vm/` - deploy Home Assistant OS as a VM (replaces existing CT with the same ID if present)

## Prerequisites

- Proxmox host reachable from where you run Ansible
- Ansible installed on the runner
- Inventory host alias `pve` (provided in each subproject `inventory.yml`)

## BIOS setup (manual)

Before running the playbooks, set the **UMA Frame Buffer Size** to the minimum allowed value (e.g. 1GB) in your BIOS. This cannot be automated via Ansible. The kernel boot parameters configured by `proxmox-bootstrap/` handle unified memory allocation — a large static VRAM reservation wastes memory that vLLM and ComfyUI could use.

Path varies by vendor but is typically under **Advanced > AMD CBS > NBIO > GFX Configuration**.

## Quick Start

Use either the `Makefile` or direct `ansible-playbook` calls.

Note: `make` is optional. If it is not installed, use the manual `ansible-playbook` commands below.

```bash
cd ~/dev/nimo-strix-halo-homelab
make bootstrap
reboot
make lxc
make dev
make comfyui
make postgres
make ha
```

## Manual Run Order

```bash
cd ~/dev/nimo-strix-halo-homelab/proxmox-bootstrap
ansible-playbook site.yml
reboot

cd ~/dev/nimo-strix-halo-homelab/llm-lxc
ansible-playbook site.yml

cd ~/dev/nimo-strix-halo-homelab/dev-lxc
ansible-playbook site.yml

cd ~/dev/nimo-strix-halo-homelab/comfyui-lxc
ansible-playbook site.yml

cd ~/dev/nimo-strix-halo-homelab/postgres-lxc
ansible-playbook site.yml

cd ~/dev/nimo-strix-halo-homelab/home-assistant-vm
ansible-playbook site.yml
```

## Configuration

- Host tuning variables: `proxmox-bootstrap/group_vars/all.yml`
- LLM LXC defaults: `llm-lxc/group_vars/all.yml`
- LLM LXC host overrides: `llm-lxc/host_vars/pve.yml`
- Dev LXC defaults: `dev-lxc/group_vars/all.yml`
- Dev LXC host overrides: `dev-lxc/host_vars/pve.yml`
- ComfyUI defaults: `comfyui-lxc/group_vars/all.yml`
- ComfyUI host overrides: `comfyui-lxc/host_vars/pve.yml`
- PostgreSQL defaults: `postgres-lxc/group_vars/all.yml`
- PostgreSQL host overrides: `postgres-lxc/host_vars/pve.yml`
- Home Assistant defaults: `home-assistant-vm/group_vars/all.yml`
- Home Assistant host overrides: `home-assistant-vm/host_vars/pve.yml`
