{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./homepkgs.nix
    ./git.nix
    ./gh.nix
    ./distrobox.nix
  ];
}