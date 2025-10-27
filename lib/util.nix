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
            {
              pkgs,
              modulesPath,
              lib,
              ...
            }:
            {
              isoImage.squashfsCompression =
                "xz -comp xz -b 1M -Xdict-size 1M" + lib.optionalString pkgs.stdenv.hostPlatform.isx86 " -Xbcj x86";
            }
          )
        ]
        ++ extraModules;
      };
    };
}
