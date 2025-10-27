{
  self,
  pkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-graphical-base.nix")
    "${self}/services/bluetooth.nix"
    "${self}/boot.nix"
    "${self}/desktop/font.nix"
    "${self}/desktop/ime.nix"
    "${self}/misc.nix"
    "${self}/nix.nix"
    "${self}/packages.nix"
    "${self}/services/pipewire.nix"
    "${self}/programs/firefox.nix"
    "${self}/programs/htop.nix"
    "${self}/programs/bat.nix"
    "${self}/programs/zsh.nix"
    "${self}/systemd.nix"
    "${self}/services/tlp.nix"
    "${self}/services/udisks2.nix"
    "${self}/services/gvfs.nix"
    "${self}/user-nixos.nix"
  ];
  environment.systemPackages = with pkgs; [ keepassxc ];
  environment.xfce.excludePackages = with pkgs.xfce; [
    parole
  ];

  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
      xfce.enableScreensaver = false;
    };
    displayManager.startx.enable = true;
    excludePackages = [ pkgs.xterm ];
  };
  home-manager.users.nixos = {
    programs.zsh = {
      enable = true;
      profileExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
          startx
        fi
      '';
    };
    home.file.".xinitrc".text = ''
      exec xfce4-session
    '';
  };
}
