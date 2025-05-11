{ pkgs, ... }: {
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.vscode.enable
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [];
  };
}