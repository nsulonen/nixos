{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim
    gh
    vscode
    wget
    distrobox
  ];
}
