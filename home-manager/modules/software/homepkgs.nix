{ config, lib, pkgs, ... }:

{
    home.packages = with pkgs; [
    catppuccin-cursors
    papirus-icon-theme
  ];
}