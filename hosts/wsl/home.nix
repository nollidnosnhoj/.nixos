{...}: {
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/editors/neovim
    ../../modules/home/programs/cli.nix
    ../../modules/home/programs/dev.nix
    ../../modules/home/shell
  ];

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "wsl-open";
    };
  };
}
