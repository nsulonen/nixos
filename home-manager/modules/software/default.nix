{ config, lib, pkgs, ... }:

{
  imports = [
    ./homepkgs.nix
    ./git.nix
    ./gh.nix
    ./distrobox.nix
  ];
}