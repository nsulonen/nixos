{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "nsulonen";
    userEmail = "niko.sulonen@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}