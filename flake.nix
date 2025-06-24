{
    description = "A simple Nix flake for system configuration";
    
    inputs = {

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
    };

    outputs = { nixpkgs, nix-flatpak, home-manager, ... }: {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./nixos/system.nix
                nix-flatpak.nixosModules.nix-flatpak
            ];
        };

        homeConfigurations.niko = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [ ./home-manager/home.nix ];
        };
    };          
}