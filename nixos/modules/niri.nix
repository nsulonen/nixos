{ config, lib, pkgs, ... }:

{
    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      alacritty
      swaylock
      waybar
      mako
      fuzzel
      xwayland-satellite
    ];
}
