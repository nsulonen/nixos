{ config, lib, pkgs, ... }:
{
    hardware.graphics = {
        enable = true;
        enable32bit = true;
    };
}