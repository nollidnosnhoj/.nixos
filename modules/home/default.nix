{...}: {
  # Place modules that will be used in all x-top machines
  imports = [
    ./browsers/zen.nix
    ./desktop
    ./discord.nix
    ./editors/neovim
    ./editors/vscode
    ./editors/zed
    ./foot.nix
    ./git/git.nix
    ./programs
    ./scripts
    ./shell
    ./stylix.nix
    ./udiskie.nix
    ./xdg-mimes.nix
  ];
}
