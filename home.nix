{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # Import modular configurations
  imports = [
    ./modules/home-manager/packages.nix
    ./modules/home-manager/programs.nix
    ./modules/home-manager/system.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true; # Workaround for unfree packages
    };
  };

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