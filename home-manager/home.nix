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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # State version for compatibility
  home.stateVersion = "25.05";
}