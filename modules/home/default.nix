{...}: {
  # Place modules that will be used in all x-top machines
  imports = [
    ./browsers/zen.nix
    ./discord.nix
    ./editors/neovim
    ./editors/rider
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
