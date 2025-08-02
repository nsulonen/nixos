{ config, lib, pkgs, ... }:

{
    programs.niri.enable = true;

    #environment.systemPackages = with pkgs; [
    #  alacritty
    #  swaylock
    #  swaybg
    #  waybar
    #  mako
    #  fuzzel
    #  xwayland-satellite
    #];
}
