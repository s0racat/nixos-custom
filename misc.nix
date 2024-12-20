{ lib, ... }:

{
  # remove mbrola
  services.speechd.enable = false;

  # services.xserver.enable = lib.mkImageMediaOverride false;
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  #   extraPackages = with pkgs; [
  #     foot
  #     dmenu
  #     wmenu
  #     wl-clipboard
  #   ];
  # };

  time.timeZone = "Asia/Tokyo";

  networking.networkmanager.enable = lib.mkImageMediaOverride true; # Easiest to use and most distros use this by default.

}
