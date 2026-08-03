{ config, pkgs, ... }:


{
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelModules = [ "tun" ];

  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    efiSupport = true;
    useOSProber = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;
}
