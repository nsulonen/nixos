{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
    swaylock
    swaybg
    waybar
    mako
    fuzzel
    xwayland-satellite
  ];
}