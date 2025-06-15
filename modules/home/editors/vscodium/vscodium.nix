{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };

  programs.fish.shellAliases = {
    code = "codium";
  };
}
