{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-skk
        fcitx5-gtk
      ];
      waylandFrontend = true;
    };
  };
  home-manager.users.nixos = {
    home.sessionVariables = {
      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
    };
    xdg.configFile = {
      "fcitx5" = {
        source = ./fcitx5;
        recursive = true;
        force = true;
      };
      "libskk" = {
        source = ./libskk;
        recursive = true;
      };
    };
    xdg.dataFile = {
      "fcitx5/themes" = {
        source = "${pkgs.fcitx5-nord}/share/fcitx5/themes";
        recursive = true;
      };
    };
  };

}
