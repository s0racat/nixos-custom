{ lib, ... }:
{
  boot.consoleLogLevel = 3;
  boot.tmp.useTmpfs = true;
  boot.plymouth.enable = lib.mkImageMediaOverride false;
  boot.initrd.availableKernelModules= [ "exfat" ];
}
