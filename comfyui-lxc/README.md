# ComfyUI LXC

Ansible playbook that creates a Proxmox LXC container running [ComfyUI](https://github.com/comfyanonymous/ComfyUI) with AMD ROCm GPU passthrough for Strix Halo.

## What it sets up

- **Debian 13** (Trixie) privileged LXC container with GPU passthrough
- **PyTorch** with ROCm 6.3 support
- **ComfyUI** with all dependencies
- **run-comfyui** helper script
- **comfyui** systemd service (auto-start)

## Quick start

```bash
cd comfyui-lxc && ansible-playbook site.yml
```

ComfyUI is started automatically via systemd service. You can still run it manually if needed:

```bash
pct enter 102
systemctl status comfyui
run-comfyui
```

Web UI is available at `http://<container-ip>:8188`.

## Configuration

| Variable | Default | Description |
|---|---|---|
| `lxc_vmid` | `102` | Proxmox container ID |
| `lxc_hostname` | `comfyui` | Container hostname |
| `lxc_cores` | `4` | CPU cores |
| `lxc_memory_mb` | `8192` | Memory in MB (8GB) |
| `lxc_disk_gb` | `64` | Root disk size |
| `lxc_storage` | `local-lvm` | Proxmox storage pool |
| `lxc_onboot` | `true` | Auto-start on boot |
| `pytorch_rocm_index` | `https://download.pytorch.org/whl/rocm6.3` | PyTorch ROCm wheel index |

## Notes

- The PyTorch ROCm install temporarily bumps container memory to 32GB (the 4.9GB wheel download needs RAM headroom). It restores the original limit afterward.
- You'll need to download Stable Diffusion / Flux models separately. Place them in `/opt/ComfyUI/models/checkpoints/` inside the container.
- The GPU is shared with the vLLM LXC — avoid running both simultaneously for best performance.
