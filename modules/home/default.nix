{...}: {
  # Place modules that will be used in all x-top machines
  imports = [
    ./browsers
    ./development
    ./development/gui.nix
    ./discord.nix
    ./editors/neovim
    ./editors/vscode
    ./editors/zed
    ./foot.nix
    ./git.nix
    ./programs
    ./scripts
    ./shell
    ./udiskie.nix
    ./xdg-mimes.nix
  ];
}
