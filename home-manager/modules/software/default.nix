{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [

    #home.packages
    ./homepkgs.nix

    #programs
    ./git.nix
    ./gh.nix
    ./distrobox.nix
    ./firefox.nix
    ./neovim.nix
    ./vscode.nix
    
  ];
}