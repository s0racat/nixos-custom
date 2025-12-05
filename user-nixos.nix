{ pkgs, ... }:
{
  users.users.nixos.shell = pkgs.zsh;
  home-manager.users.nixos = {

    home.stateVersion = "25.11";
  };
}
