{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;  
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark-dark.yaml";
    # image = ../../home-manager/walls/nixos.jpg;
    # polarity = "dark";
  };
}