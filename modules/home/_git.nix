{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Dillon Johnson";
        email = "me@nollidnosnhoj.com";
      };
      core = {
        editor = "vim";
      };
      gpg.format = "ssh";
      init.defaultBranch = "main";
      url = {
        "git@github.com:".insteadOf = [
          "gh:"
          "https://github.com/"
        ];
      };
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
