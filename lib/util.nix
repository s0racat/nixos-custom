{
  inputs,
  nixpkgsFor,
  ...
}:
let
  inherit (inputs)
    nixpkgs
    self
    ;
in
{
  mkSystem =
    {
      name,
      system ? "x86_64-linux",
      specialArgs ? { inherit inputs self; },
      stateVersion ? "24.11",
      extraModules ? [ ],
    }:
    {
      inherit name;
      value = nixpkgs.lib.nixosSystem {
        pkgs = nixpkgsFor.${system};
        specialArgs = specialArgs // {
          inherit stateVersion;
        };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          "${self}/profiles/${name}.nix"
          {
            networking.hostName = name + "-live";
            home-manager = {
              useGlobalPkgs = true;
            };
          }
          (
            { modulesPath, ... }:
            {
              imports = [
                (modulesPath + "/installer/cd-dvd/installation-cd-graphical-base.nix")
              ];
            }
          )
        ] ++ extraModules;
      };
    };
}
