{pkgs, ...}: {
  programs.git = {
    enable = true;

    userName = "Dillon Johnson";
    userEmail = "me@nollidnosnhoj.com";

    extraConfig = {
      core = {
        editor = "nvim";
      };
      gpg.format = "openpgp";
      init.defaultBranch = "main";
      url = {
        "git@github.com:".insteadOf = [
          "gh:"
          "https://github.com/"
        ];
      };
    };
  };

  home.packages = [
    pkgs.gh
  ];

  programs.gpg.enable = true;
  services.gpg-agent.enable = true;
}
