{ pkgs, ... }:
{
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
  };
}
