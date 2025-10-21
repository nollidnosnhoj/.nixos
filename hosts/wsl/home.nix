{...}: {
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/development
    ../../modules/home/editors/neovim
    ../../modules/home/programs/cli.nix
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
    enableZshIntegration = true;
    enableBashIntegration = true;
    keys = ["id_ed25519" "id_rsa"];
  };
}
