{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    # ../modules/niri.nix
    ../modules/nvidia.nix
    ../modules/steam.nix
    ../modules/stylix.nix
  ];
}

