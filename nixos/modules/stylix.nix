{ config, lib, pkgs, ... }:

{
  stylix.enable = true;  
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  # stylix.image = ../../home-manager/walls/wall6.jpg;
}