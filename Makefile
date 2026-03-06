SHELL := /bin/bash

.PHONY: help bootstrap lxc dev comfyui ha all

help:
	@echo "Targets:"
	@echo "  make bootstrap  - Run proxmox bootstrap playbook"
	@echo "  make lxc        - Run LXC create/provision playbook"
	@echo "  make dev        - Run dev environment LXC playbook"
	@echo "  make comfyui    - Run ComfyUI LXC playbook"
	@echo "  make ha         - Replace CT 103 with Home Assistant OS VM playbook"
	@echo "  make all        - Run bootstrap then lxc, dev, comfyui, and ha"

bootstrap:
	cd proxmox-bootstrap && ansible-playbook site.yml

lxc:
	cd llm-lxc && ansible-playbook site.yml

dev:
	cd dev-lxc && ansible-playbook site.yml

comfyui:
	cd comfyui-lxc && ansible-playbook site.yml

ha:
	cd home-assistant-vm && ansible-playbook site.yml

all: bootstrap lxc dev comfyui ha
