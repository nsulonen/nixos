{ config, lib, pkgs, ... }:
{
  users.users.niko = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
