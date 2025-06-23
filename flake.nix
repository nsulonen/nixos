{
    description = "A simple Nix flake for system configuration";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {self, nixpkgs, home-manager, ...} @ inputs: let
        inherit (self) outputs;
    in {
        # Define the NixOS system configuration
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs outputs; };
                modules = [ ./nixos/configuration.nix ];
            };
        };

        # Home Manager configurations
        homeConfigurations = {
            "niko@nixos" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.x86_64-linux;
                extraSpecialArgs = { inherit inputs outputs; };
                modules = [ ./home.nix ];
            };
        };
    };
}