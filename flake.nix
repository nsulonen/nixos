{
    description = "NixOS system flake";
    
    inputs = {

        nixpkgs.url = "nixpkgs/nixos-25.05";

        niri.url = "github:sodiboo/niri-flake";

        stylix.url = "github:nix-community/stylix/release-25.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        # nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    outputs = { nixpkgs, stylix, niri, home-manager, ... }@inputs: {

        nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
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
                            imports = [ ./home-manager/home.nix ];
                        };
                    };
                }
            ];
        };
    };          
}