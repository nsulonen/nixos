{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
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

  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;


  #graphics
  hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
  
  services.xserver.videoDrivers = [ "nvidia" ];


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
    vim
    gh
    vscode
    wget
    distrobox
  ];

  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;


  #users
  users.users.niko = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };


  #settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

