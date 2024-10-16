{
  description = "Minimal NixOS installation media";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
      nixosConfigurations = {
        exampleIso = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            (
              {
                pkgs,
                modulesPath,
                inputs,
                ...
              }:
              {
                imports = [
                  (modulesPath + "/installer/cd-dvd/installation-cd-graphical-base.nix")
                  inputs.home-manager.nixosModules.home-manager
                  (./configuration.nix)
                ];
              }
            )
          ];
        };
      };
    };
}
