{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;  
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    # image = ../../home-manager/walls/nixos.jpg;
    # polarity = "dark";
  };
}