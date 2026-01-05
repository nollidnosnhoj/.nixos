{...}: {
  imports = [
    ./starship.nix
    ./tmux.nix
    ./fish.nix
  ];

  programs = {
    eza = {
      enable = true;
      enableFishIntegration = true;
    };
    direnv = {
      enable = true;
      # enableFishIntegration = true;
      nix-direnv.enable = true;
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    lsd = {
      enable = true;
      enableFishIntegration = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
