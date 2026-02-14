{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      nrb = "sudo nixos-rebuild switch --flake ~/Config/#myNixos";
      hrb = "home-manager switch";
      f = "fastfetch";
      sd = "shutdown now";
      alacritty = "alacritty --config-file $PROGRAMS_CONFIG/alacritty/alacritty.toml";
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
