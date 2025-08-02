{ config, lib, pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    name = "catppuccin-mocha-light-cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 30;
  }; 
}