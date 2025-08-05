{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  #home.packages
  home.packages = with pkgs; [

    #software
    obsidian

    #tools
    devenv
    swaybg
    xwayland-satellite

    #lsp
    nixd
    nil

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

    zen-browser = {
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

    zed-editor = {
      enable = true;
      extensions = [ "nix" ];
    };

    ghostty = {
      enable = true;
    };

    swaylock = {
      enable = true;
    };

    waybar = {
      enable = true;
    };

    fuzzel = {
      enable = true;
    };
  };
}
