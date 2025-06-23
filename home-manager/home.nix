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

  # Home Packages
  home.packages = with pkgs; [
    gh
    vscode
    distrobox
  ];

  # Programs
  programs = {
    git = {
      enable = true;
      userName = "nsulonen";
      userEmail = "niko.sulonen@proton.me";
      init.defaultBranch = "main";
    };
    firefox = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # State version for compatibility
  home.stateVersion = "25.05";
}