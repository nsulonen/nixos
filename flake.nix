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

        # nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = { nixpkgs, stylix, niri, home-manager, ... }@inputs: {

    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/desktop
          # nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix
          niri.nixosModules.niri

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.niko = {
                imports = [
                  ./home-manager/home.nix
                  inputs.zen-browser.homeModules.twilight
                ];
              };
            };
          }
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/laptop
          # nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix
          niri.nixosModules.niri

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = false;
              useUserPackages = true;
              backupFileExtension = "backup";
              users.niko = {
                imports = [
                  ./home-manager/home.nix
                  inputs.zen-browser.homeModules.twilight
                ];
              };
            };
          }
        ];
      };
    };
	};
}
