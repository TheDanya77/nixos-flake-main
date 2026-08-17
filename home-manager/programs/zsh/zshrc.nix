{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      changemac = "sudo ip link set dev eno2 down && sudo macchanger -r eno2 && sudo ip link set dev eno2 up";
      resetmac = "sudo ip link set dev eno2 down && sudo macchanger -p eno2 && sudo ip link set dev eno2 up";
      nrb = "git -C ~/Config add . && sudo nixos-rebuild switch --flake ~/Config/#myNixos";
      hrb = "home-manager switch";
      f = "fastfetch";
      sd = "shutdown now";
      alacritty = "alacritty --config-file $PROGRAMS_CONFIG/alacritty/alacritty.toml";
      check = "systemd-analyze blame | head -n 20 &&
               systemd-analyze critical-chain &&
               journalctl -b -p 3 &&
               journalctl -u home-manager-thedanya.service -b &&
               systemd-analyze blame | head -n 20 &&
               journalctl -u home-manager-thedanya.service -b";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
    plugins = [
        # {
        #   name = "zsh-autosuggestions";
        #   src = pkgs.zsh-autosuggestions;
        #   file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
        # }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.zsh-syntax-highlighting;
          file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
        }
        {
          name = "zsh-completions";
          src = pkgs.zsh-completions;
          file = "share/zsh-completions/zsh-completions.zsh";
        }
      ];

    initContent = ''
      export TEST="TEST"
      export MY_CONFIG="/home/thedanya/Config"
      export PROGRAMS_CONFIG="/home/thedanya/Config/home-manager/programs"

      # Powerlevel10k theme
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f $PROGRAMS_CONFIG/zsh/.p10k.zsh ]] && source $PROGRAMS_CONFIG/zsh/.p10k.zsh
    '';
  };
}
