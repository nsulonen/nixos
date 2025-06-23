{
    description = "A simple Nix flake for system configuration";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = inputs@{ nixpkgs, home-manager, ... }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./nixos/configuration.nix
                    
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users.niko = import ./home-manager/home.nix;
                    }
                ];
            };
        };
    };          
}