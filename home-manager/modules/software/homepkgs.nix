{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [

    #software
    obsidian

    #tools
    devenv

    #file management
    nautilus

  ];
}