{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../common.nix
    ../modules/niri.nix
    ../modules/nvidia.nix
    ../modules/steam.nix
  ];
}

