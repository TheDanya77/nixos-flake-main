{ config, pkgs, ... }:

{

  imports =
    [
      ./configs.nix
      ./programs/programs.nix
    ];

  home.username = "thedanya";
  home.homeDirectory = "/home/thedanya";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
    zsh-powerlevel10k
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
        "image/png" = "eog.desktop";
        "image/jpeg" = "eog.desktop";
        "image/jpg" = "eog.desktop";
        "image/gif" = "eog.desktop";
        "image/webp" = "eog.desktop";
        "image/bmp" = "eog.desktop";
        "image/svg+xml" = "eog.desktop";
      };
  };

  xdg.configFile."mimeapps.list".force = true;

  programs.home-manager.enable = true;
}
