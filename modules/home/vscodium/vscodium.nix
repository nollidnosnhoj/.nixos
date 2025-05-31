{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  programs.zsh.shellAliases = {
    code = "codium";
  };
}
