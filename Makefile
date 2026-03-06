SHELL := /bin/bash

.PHONY: help bootstrap lxc all

help:
	@echo "Targets:"
	@echo "  make bootstrap  - Run proxmox bootstrap playbook"
	@echo "  make lxc        - Run LXC create/provision playbook"
	@echo "  make all        - Run bootstrap then lxc"

bootstrap:
	cd proxmox-bootstrap && ansible-playbook site.yml

lxc:
	cd llm-lxc && ansible-playbook site.yml

all: bootstrap lxc
