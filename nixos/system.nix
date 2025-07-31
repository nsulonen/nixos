{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./modules/niri.nix
      ./modules/nvidia.nix
    ];

  system.stateVersion = "25.05";

  #bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  #networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;


  #locale
  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };


  #desktop
  services.xserver = {
    enable = true;
    xkb.layout = "fi";
    xkb.options = "eurosign:e,caps:escape";

    #login manager
    displayManager.gdm.enable = true;
  };


  #graphics
  hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };


  #sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };


  #virtualization
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };


  #packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    gh
    vscode
    distrobox
    vim
    wget
    obsidian
    devenv
    nautilus
    swaybg
    xsettingsd
    xorg.xrdb
  ];


  #fonts packages
  fonts.packages = with pkgs; [
    font-awesome
  ];


  #programs
  programs = {
    git = {
      enable = true;
      config = {
        user.name = "nsulonen";
        user.email = "niko.sulonen@proton.me";
        init.defaultBranch = "main";
      };
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };


  #flatpaks
  services.flatpak = {
    enable = true;

    update.auto = {
      enable = true;
      onCalendar = "daily";
    };

    packages = [
    "org.libreoffice.LibreOffice"
    "app.zen_browser.zen"
    "org.videolan.VLC"
    ];
  };


  #users
  users.users.niko = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };


  #settings
  nix.settings = {
    trusted-users = ["root" "niko"];
    experimental-features = [ "nix-command" "flakes" ];
  };

  #theme
  services.xserver.displayManager.lightdm.greeters.gtk = {
    enable = true;
    theme = {
      name = "Breeze-Dark";
      package = pkgs.libsForQt5.breeze-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Light-Cursors";
      package = pkgs.catppuccin-cursors.mochaLight;
    };
    #gtk3 = {
    #  extraConfig.gtk-application-prefer-dark-theme = true;
    #};
  };
}

