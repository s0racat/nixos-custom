{ pkgs, ... }:
{
  fonts.enableDefaultPackages = false;
  fonts.packages = with pkgs; [
    ipaexfont
    roboto-mono
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "IPAexMincho" ];
      sansSerif = [ "IPAexGothic" ];
      monospace = [ "Roboto Mono" ];
    };
  };
}
