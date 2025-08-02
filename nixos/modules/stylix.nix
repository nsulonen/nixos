{ config, lib, pkgs, ... }:

{
  stylix = {
    enable = true;  
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    image = ../../home-manager/walls/wall3.jpg;
    polarity = "dark";
  };
}