{ lib, ... }:
{
  boot.consoleLogLevel = 3;
  boot.tmp.useTmpfs = true;
  boot.plymouth.enable = lib.mkImageMediaOverride false;
  # include exfat kernel driver
  boot.initrd.availableKernelModules = [ "exfat" ];
}
