{pkgs, ...}: {
  programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      # Languages
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      mads-hartmann.bash-ide-vscode

      leonardssh.vscord
      biomejs.biome
      christian-kohler.path-intellisense
      esbenp.prettier-vscode
    ];
  };
}
