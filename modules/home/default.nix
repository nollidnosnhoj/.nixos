{...}: {
  # Place modules that will be used in all x-top machines
  imports = [
    ./browser
    ./desktop
    ./discord.nix
    ./editors/neovim
    ./editors/vscode
    ./editors/zed
    ./flatpak.nix
    ./git.nix
    ./programs
    ./shell
    ./stylix.nix
    ./terminals/foot.nix
    ./udiskie.nix
    ./xdg-mimes.nix
  ];
}
