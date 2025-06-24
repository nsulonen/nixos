{ config, lib, pkgs, ... }:

{
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;

        open = true;

        package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  
    services.xserver.videoDrivers = [ "nvidia" ];
}