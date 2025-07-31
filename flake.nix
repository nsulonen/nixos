{
    description = "A simple Nix flake for system configuration";
    
    inputs = {

        nixpkgs.url = "nixpkgs/nixos-25.05";

        nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

        catppuccin.url = "github:catppuccin/nix";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
    };

    outputs = { nixpkgs, nix-flatpak, home-manager, ... }@inputs: {

        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./nixos/system.nix
                nix-flatpak.nixosModules.nix-flatpak
                catppuccin.homeManagerModules.catppuccin
                home-manager.nixosModules.home-manager
            ];
        };
    };          
}