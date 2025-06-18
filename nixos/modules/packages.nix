{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    vim
    #gh
    #vscode
    wget
    #distrobox
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;
}
