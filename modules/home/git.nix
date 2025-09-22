{
  pkgs,
  username,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "Dillon Johnson";
    userEmail = "me@nollidnosnhoj.com";
    signing.key = "~/.ssh/id_ed25519.pub";

    extraConfig = {
      core = {
        attributesfile = "~/.gitattributes";
        editor = "nvim";
        sshCommand = "ssh -i /home/${username}/.ssh/id_ed25519";
      };
      gpg = {
        format = "openpgp";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
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

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };
}
