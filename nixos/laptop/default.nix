{ ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/stylix.nix
  ];
}
