{ self, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-base.nix")
    "${self}/boot.nix"
    "${self}/misc.nix"
    "${self}/nix.nix"
    "${self}/packages.nix"
    "${self}/programs/htop.nix"
    "${self}/programs/bat.nix"
    "${self}/programs/zsh.nix"
    "${self}/systemd.nix"
    "${self}/services/tlp.nix"
    "${self}/user-nixos.nix"
  ];

}
