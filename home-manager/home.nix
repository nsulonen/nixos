{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {

  home = {
    username = "niko";
    homeDirectory = "/home/niko";
    stateVersion = "25.05";
  };

  home.packages = with pkgs; [
    catppuccin-cursors
    papirus-icon-theme
  ];

  # Manage configurations with Home Manager
  home.file = {

    # Niri
    ".config/niri/config.kdl".source = ./dots/niri/config.kdl;

    # Waybar
    ".config/waybar/config.jsonc".source = ./dots/waybar/config;
    ".config/waybar/style.css".source = ./dots/waybar/style.css;

  };

  # Themes
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
      };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "catppuccin-mocha-light-cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 30;
  }; 
  
  # Reload system units when changing configs
  systemd.user.startServices = "sd-switch";

}