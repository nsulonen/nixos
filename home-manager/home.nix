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
  };

  # Enable Home Manager features
  programs.home-manager.enable = true;

  # Manage configurations with Home Manager
  home.file = {

    # Niri
    ".config/niri/config.kdl".source = ./dots/niri/config.kdl;

    # Waybar
    ".config/waybar/config.jsonc".source = ./dots/waybar/config;
    ".config/waybar/style.css".source = ./dots/waybar/style.css;

  };

  # Set Catppuccin theme
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  # Set cursor theme
  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Light-Cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 16;
  };
  
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # State version for compatibility
  home.stateVersion = "25.05";
}