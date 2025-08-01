{ config, lib, pkgs, ... }: 

{
  home = {
    username = "niko";
    homeDirectory = "/home/niko";
    stateVersion = "25.05";
  };

  home.packages = with pkgs; [
    catppuccin-cursors
    papirus-icon-theme
  ];

  #programs
  programs = {
    git = {
      enable = true;
      config = {
        user.name = "nsulonen";
        user.email = "niko.sulonen@proton.me";
        init.defaultBranch = "main";
      };
    };
  };

  #configurations
  home.file = {
    #niri
    ".config/niri/config.kdl".source = ./dots/niri/config.kdl;
    #waybar
    ".config/waybar/config.jsonc".source = ./dots/waybar/config;
    ".config/waybar/style.css".source = ./dots/waybar/style.css;
  };

  #themes
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
  
  

  systemd.user.startServices = "sd-switch";
}