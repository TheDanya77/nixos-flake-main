{ pkgs, ... }:

{
  users.users.thedanya = {
    isNormalUser = true;
    description = "Danya";
    extraGroups = [ "networkmanager" "wheel" "dialout" ];
    shell = pkgs.zsh;
  };
}
