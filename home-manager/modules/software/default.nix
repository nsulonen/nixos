{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./homepkgs.nix
  ];
}