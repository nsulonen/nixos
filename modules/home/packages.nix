{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
    vscode
    distrobox
    firefox
  ];
}
