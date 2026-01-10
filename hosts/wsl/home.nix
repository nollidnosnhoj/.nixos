{...}: {
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/development.nix
    # ../../modules/home/editors/neovim
    ../../modules/home/editors/neovim/nvf
    ../../modules/home/programs/default-cli.nix
    ../../modules/home/shell
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "wsl-open";
    };
  };

  programs.keychain = {
    enable = true;
    enableFishIntegration = true;
    keys = ["id_ed25519"];
  };

  home.stateVersion = "25.11";
}
