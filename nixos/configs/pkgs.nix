{ pkgs, ... }:

let
  # Кастомна AppImage-обгортка винесена окремо, щоб не захаращувати systemPackages
  pineconeMC = pkgs.appimageTools.wrapType2 rec {
    pname = "PineconeMC";
    version = "1.0.0";
    src = ../appImages/PineconeMC.AppImage;

    extraPkgs = pkgs: with pkgs; [
      cacert
      openssl
      zlib
    ];

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      cat <<EOF > $out/share/applications/${pname}.desktop
      [Desktop Entry]
      Type=Application
      Name=PineconeMC
      Exec=${pname}
      Terminal=false
      Categories=Game;
      EOF
    '';
  };
in
{
  # ---------------------------------------------------------------------------
  # System Packages
  # ---------------------------------------------------------------------------
  environment.systemPackages = with pkgs; [
    # --- System & CLI Utilities ---
    btop
    tree
    jq
    unzip
    wget
    curl
    git
    macchanger
    nmap
    wl-clipboard
    grim
    slurp
    home-manager

    # --- Editors & Terminals ---
    alacritty
    zed-editor

    # --- Daily Applications ---
    thunar
    eog
    firefox
    discord
    ayugram-desktop
    teams-for-linux
    pavucontrol
    easyeffects
    blueman
    unrar

    # --- Desktop Environment / Wayland Tools ---
    waybar
    wofi
    cava
    nwg-look
    gpu-screen-recorder-gtk

    # --- Qt / GTK Theming ---
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    dracula-theme
    dracula-icon-theme
    kdePackages.breeze

    # --- Custom Packages ---
    pineconeMC
  ];

  # ---------------------------------------------------------------------------
  # Programs & System Tools
  # ---------------------------------------------------------------------------
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  services.tailscale.enable = true;

  programs.nix-ld.enable = true;
  programs.gpu-screen-recorder.enable = true;

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # ---------------------------------------------------------------------------
  # Services, Portals & Hardware
  # ---------------------------------------------------------------------------
  services.flatpak.enable = true;

  # Налаштування XDG Portals для сумісності з Wayland/Hyprland
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # ---------------------------------------------------------------------------
  # Fonts
  # ---------------------------------------------------------------------------
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
