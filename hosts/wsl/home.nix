{...}: {
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/development
    ../../modules/home/programs/cli
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
