{...}: {
  # Place modules that will be used in all x-top machines
  imports = [
    ./browsers/firefox.nix
    ./desktop
    ./discord.nix
    ./editors/neovim
    ./editors/vscode
    ./editors/zed
    ./flatpak.nix
    ./foot.nix
    ./git.nix
    ./programs
    # ./scripts
    ./shell
    ./stylix.nix
    ./udiskie.nix
    ./xdg-mimes.nix
  ];
}
