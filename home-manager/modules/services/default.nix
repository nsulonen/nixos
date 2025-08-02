{ config, lib, pkgs, ... }:

{
  services = {

    #podman for distrobox
    podman = {
      enable = true;
    };
  };
  
  systemd.user.startServices = "sd-switch";
}