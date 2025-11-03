{host, ...}: {
  programs.zsh = {
    enable = true;
    antidote = {
      enable = true;
      plugins = [
        "belak/zsh-utils path:completion"
        "belak/zsh-utils path:editor"
        "belak/zsh-utils path:history"
        "belak/zsh-utils path:prompt"
        "belak/zsh-utils path:utility"
        "zdharma-continuum/fast-syntax-highlighting kind:defer"
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-completions"
      ];
    };
    initContent = ''
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';
    history = {
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      extended = true;
      share = true;
      size = 10000;
      save = 10000;
    };

    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      py = "python";
      dsize = "du -hs";
      findw = "grep -rl";
      pdf = "tdf";
      open = "xdg-open";

      ls = "lsd --group-directories-first";
      ll = "lsd -l --group-directories-first";
      la = "lsd -la --group-directories-first";
      tree = "lsd -l --group-directories-first --tree --depth=2";

      # Nixos
      cdnix = "cd ~/.nixos && nvim ~/.nixos";
      ns = "nix-shell --run zsh";
      nix-shell = "nix-shell --run zsh";
      nix-switch = "noglob sudo nixos-rebuild switch --flake ~/.nixos#${host}";
      nix-switchu = "noglob sudo nixos-rebuild switch --upgrade --flake ~/.nixos#${host}";
      nix-flake-update = "noglob sudo nix flake update ~/.nixos#";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";

      # Git
      ga = "git add";
      gaa = "git add --all";
      gs = "git status";
      gb = "git branch";
      gm = "git merge";
      gpl = "git pull";
      gplo = "git pull origin";
      gps = "git push";
      gpst = "git push --follow-tags";
      gpso = "git push origin";
      gc = "git commit";
      gcm = "git commit -m";
      gcma = "git add --all && git commit -m";
      gtag = "git tag -ma";
      gch = "git checkout";
      gchb = "git checkout -b";
      gcoe = "git config user.email";
      gcon = "git config user.name";

      # to fix std lib issues
      obsidian = "export LD_LIBRARY_PATH=$NIX_LD_LIBRARY_PATH; obsidian";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
