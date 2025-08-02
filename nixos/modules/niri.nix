{ inputs, config, lib, pkgs, ... }:

{
    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri.enable = true;
}
