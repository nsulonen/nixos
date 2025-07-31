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
  
  # Reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # State version for compatibility
  home.stateVersion = "25.05";
}