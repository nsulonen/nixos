{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix
      ./modules/niri.nix
      ./modules/nvidia.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  system.stateVersion = "25.05";


  #home-manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backup";
    users.niko = {
      imports = [
          ../home-manager/home.nix
          inputs.catppuccin.homeModules.catppuccin
      ];
    };
  };


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
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];


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

    libvirtd = {
      enable = true;
      qemu.runAsRoot = false;
      qemu.swtpm.enable = true;
      qemu.package = pkgs.qemu_kvm;
      qemu.ovmf.enable = true;
    };
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
    virt-manager
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
  users = {

    users.niko = {
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" ];
    };

  };


  #settings
  nix.settings = {
    trusted-users = ["root" "niko"];
    experimental-features = [ "nix-command" "flakes" ];
  };
}

