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
  };

  
  #kde
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;


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
    "org.mozilla.firefox"
    "org.videolan.VLC"
    ];
  };


  #users
  users.users.niko = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };


  #settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

