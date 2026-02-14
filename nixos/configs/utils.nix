{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.printing.enable = true;
  services.dbus.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
  };

  services.displayManager.autoLogin = {
    enable = true;
    user = "thedanya";
  };
}
