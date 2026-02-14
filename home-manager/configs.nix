{
  home.file.".config/hypr" = {
    source = ./programs/hypr;
    recursive = true;
    force=true;
  };

  home.file.".config/fastfetch" = {
    source = ./programs/fastfetch;
    recursive = true;
  };

  # home.file.".config/waybar" = {
  #   source = ./programs/waybar;
  #   recursive = true;
  #   force = true;
  # };
}
