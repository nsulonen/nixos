{ config, lib, pkgs, ... }:

{
  imports = [
    ./niri
    ./waybar
  ];
}