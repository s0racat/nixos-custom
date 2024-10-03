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
    { self, nixpkgs }@inputs:
    {
      nixosConfigurations = {
        exampleIso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            (
              { pkgs, modulesPath, ... }:
              {
                imports = [
                  (modulesPath + "/installer/cd-dvd/installation-cd-base.nix")
                  (./configuration.nix)
                ];
              }
            )
          ];
        };
      };
    };
}
