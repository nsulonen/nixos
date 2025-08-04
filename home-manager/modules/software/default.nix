{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  #home.packages
  home.packages = with pkgs; [

    #software
    obsidian

    #tools
    devenv

    #file management
    nautilus

  ];

  #programs
  programs = {

    distrobox = {
		  enable = true;
	  };

    firefox = {
      enable = true;
    };

    gh = {
      enable = true;
      hosts = {
        "github.com" = {
          user = "nsulonen";
        };
      };
    };

    git = {
      enable = true;
      userName = "nsulonen";
      userEmail = "niko.sulonen@proton.me";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    neovim = {
      enable = true;
    };

    vscode = {
      enable = true;
      profiles = {
        "Default" = {
          userSettings = {
            "editor.inlineSuggest.enabled" = false;
          };
        };
      };
    };
  };  
}
