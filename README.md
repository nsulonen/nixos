# NixOS System Configuration

This repository contains the NixOS system configuration managed as a Nix flake. It includes configurations for desktop and laptop systems, home-manager settings, and various modules.

## Features

- Desktop and laptop hardware configuration
- Home-manager setup including custom modules and software
- Theming support with Stylix
- Window management with Niri
- Support for NVIDIA drivers and Steam

## Directory Structure

- `nixos/desktop/` - Desktop system configuration
- `nixos/laptop/` - Laptop system configuration
- `home-manager/` - Home user configuration using home-manager
- `flake.nix` - Flake entry point defining inputs and outputs

## Usage

This configuration requires Nix with flakes enabled.

Switch to the desktop system configuration:

```bash
sudo nixos-rebuild switch --flake .#desktop
```

For laptop configuration:

```bash
sudo nixos-rebuild switch --flake .#laptop
