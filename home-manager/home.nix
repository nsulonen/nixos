{ config, lib, pkgs, ... }: 

{
  programs.home-manager = {
    enable = true;
  };

  programs.niri.enable = true;

  home = {
    username = "niko";
    homeDirectory = "/home/niko";
    stateVersion = "25.05";
  };

  imports = [
    ./modules/configs
    ./modules/services
    ./modules/software
    ./modules/themes
  ];
}