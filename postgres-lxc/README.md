# PostgreSQL + pgvector LXC

Creates a Debian LXC (VMID 104) with PostgreSQL and pgvector extension ready.

## What it does

- Creates PostgreSQL LXC container
- Installs PostgreSQL 17 + pgvector package
- Creates application DB/user
- Enables `vector` extension in the target DB
- Configures PostgreSQL to listen on LAN

## Run

```bash
cd ~/dev/nimo-strix-halo-homelab/postgres-lxc
ansible-playbook site.yml
```

## Verify

```bash
pct exec 104 -- systemctl is-active postgresql
pct exec 104 -- sudo -u postgres psql -d app -c "\\dx"
```
