{ config, lib, pkgs, ... }:

{
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

	# xdg desktop portal
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

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

	#virtualisation
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };

	#users
  users = {
    users.niko = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

	#settings
  nix.settings = {
    trusted-users = ["root" "niko"];
    experimental-features = [ "nix-command" "flakes" ];
  };

	#packages
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
    # xsettingsd
    # xorg.xrdb
  ];


  #fonts packages
  fonts.packages = with pkgs; [
    font-awesome
  ];


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
	

	
	nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}