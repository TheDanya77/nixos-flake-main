{ pkgs, ... }:

{
  users.users.thedanya = {
    isNormalUser = true;
    description = "Danya";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
