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

  home.packages = with pkgs; [
    catppuccin-cursors
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
  home.sessionVariables = {
    XCURSOR_THEME = "Catppuccin-Mocha-Light-Cursors";
    XCURSOR_SIZE = "36";
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "Catppuccin-Mocha-Light-Cursors";
    package = pkgs.catppuccin-cursors.mochaLight;
    size = 36;
  }; 
  
  # Reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # State version for compatibility
  home.stateVersion = "25.05";

  # Enable Home Manager features
  programs.home-manager.enable = true;

}