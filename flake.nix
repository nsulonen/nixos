{
  description = "NixOS system flake";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    niri.url = "github:sodiboo/niri-flake";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      stylix,
      niri,
      zen-browser,
      home-manager,
      ...
    }@inputs:
    let
      makeSystem =
        systemConfigFile:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            systemConfigFile
            stylix.nixosModules.stylix
            niri.nixosModules.niri
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = false;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.niko = {
                  imports = [
                    ./home-manager/home.nix
                    zen-browser.homeModules.twilight
                  ];
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = makeSystem ./nixos/desktop;
        laptop = makeSystem ./nixos/laptop;
      };
    };
}
