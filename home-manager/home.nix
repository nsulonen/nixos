{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Import modular configurations
  imports = [
    ./modules/home/packages.nix
    ./modules/home/programs.nix
    ./modules/home/system.nix
  ];

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