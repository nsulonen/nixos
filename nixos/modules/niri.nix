{ config, lib, pkgs, ... }:

{
    imports = [ niri.nixosModules.niri ];

    programs.niri.enable = true;
}
