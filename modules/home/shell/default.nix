{...}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./fastfetch.nix
    ./lazygit.nix
    ./starship.nix
    ./tmux.nix
    ./fish.nix
  ];

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
