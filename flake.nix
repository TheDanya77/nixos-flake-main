{
  description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    serpantinum.url = "github:ilyamiro/serpantinum";
  };

  outputs = { self, nixpkgs, home-manager, serpantinum, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      myNixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit serpantinum; };
        modules = [
          ./nixos/configuration.nix
          serpantinum.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit serpantinum; };
            home-manager.sharedModules = [ serpantinum.homeManagerModules.default ];
            home-manager.users.thedanya = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}
