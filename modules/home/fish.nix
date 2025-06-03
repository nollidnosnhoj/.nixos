{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = "
      
      set -g fish_greeting ''
      fastfetch
    ";

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake .#msa1";
    };
  };
}
