{ pkgs, stateVersion, ... }:
{
  users.users.nixos.shell = pkgs.zsh;
  home-manager.users.nixos = {

    home.stateVersion = stateVersion;
  };
}
