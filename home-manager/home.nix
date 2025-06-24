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

    # Configuration file for Niri
    ".config/niri/config.kdl".source = ./dots/config.kdl;
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # State version for compatibility
  home.stateVersion = "25.05";
}