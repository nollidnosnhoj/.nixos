{host, ...}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      # cat = "bat";
      py = "python";
      dsize = "du -hs";
      findw = "grep -rl";
      pdf = "tdf";
      open = "xdg-open";

      # ls = "lsd --group-directories-first";
      # ll = "lsd -l --group-directories-first";
      # la = "lsd -la --group-directories-first";
      tree = "lsd -l --group-directories-first --tree --depth=2";

      # Nixos
      cdnix = "cd ~/.nixos && nvim ~/.nixos";
      ns = "nix-shell --run fish";
      nix-shell = "nix-shell --run fish";
      nix-switch = "sudo nixos-rebuild switch --flake ~/.nixos#${host}";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/.nixos#${host}";
      nix-flake-update = "sudo nix flake update";
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

  programs.man.generateCaches = false;
}
