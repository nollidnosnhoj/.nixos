{...}: {
  imports = [
    ./starship.nix
    ./tmux.nix
    ./fish.nix
  ];

  programs = {
    atuin = {
      enable = true;
      enableFishIntegration = true;
      daemon.enable = true;
    };
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
