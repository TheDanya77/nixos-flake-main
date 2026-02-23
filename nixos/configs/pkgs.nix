{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     thunar
     home-manager
     vim
     neovim
     wget
     curl
     git
     alacritty
     btop
     telegram-desktop
     wofi
     cava
     discord
     pavucontrol
     firefox
     tree
     kdePackages.kate
     zed-editor
     jq
     kitty
     teams-for-linux
     nwg-look
     libsForQt5.qt5ct
     libsForQt5.qtstyleplugin-kvantum
     kdePackages.qt6ct
     kdePackages.qtstyleplugin-kvantum
     dracula-theme
     dracula-icon-theme
     kdePackages.breeze
     eog
     waybar
     grim
     slurp
     wl-clipboard
     bluez
     bluez-tools
     blueman
  ];

  programs.zsh.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  users.defaultUserShell = pkgs.zsh;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # Or your preferred Nerd Font
  ];
}
