{...}: {
  # Place modules that will be used in all x-top machines
  imports = [
    ./desktop
    ./discord.nix
    ./editors/neovim
    ./editors/vscodium
    ./editors/zed
    ./flatpak.nix
    ./ghostty.nix
    ./git.nix
    ./kitty.nix
    ./programs
    ./shell
    ./stylix.nix
    ./xdg-mimes.nix
  ];
}
