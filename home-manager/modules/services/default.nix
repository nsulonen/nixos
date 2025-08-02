{ config, lib, pkgs, ... }:

{
  systemd.user.startServices = "sd-switch";
}