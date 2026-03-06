SHELL := /bin/bash

.PHONY: help bootstrap lxc dev all

help:
	@echo "Targets:"
	@echo "  make bootstrap  - Run proxmox bootstrap playbook"
	@echo "  make lxc        - Run LXC create/provision playbook"
	@echo "  make dev        - Run dev environment LXC playbook"
	@echo "  make all        - Run bootstrap then lxc and dev"

bootstrap:
	cd proxmox-bootstrap && ansible-playbook site.yml

lxc:
	cd llm-lxc && ansible-playbook site.yml

dev:
	cd dev-lxc && ansible-playbook site.yml

all: bootstrap lxc dev
