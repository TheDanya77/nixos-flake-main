{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./configs/hardware-configuration.nix
      ./configs/utils.nix
      ./configs/boot.nix
      ./configs/network.nix
      ./configs/locale.nix
      ./configs/display-manager.nix
      ./configs/pipewire.nix
      ./configs/users.nix
      ./configs/pkgs.nix
      ./configs/gpu.nix
      ./configs/hyprland.nix
      ./configs/bluetooth.nix

      ./configs/optimization/block-wifi.nix
      ./configs/optimization/block-ucsi_ccg.nix
    ];

  programs.serpantinum.enable = true;

  system.stateVersion = "25.11";
}
