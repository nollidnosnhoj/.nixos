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
      core.attributesfile = "~/.gitattributes";
      core.sshCommand = "ssh -i /home/${username}/.ssh/id_ed25519";
      credential.helper = "cache";
      diff.colorMoved = "default";
      init.defaultBranch = "main";
      gpg.format = "openpgp";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      merge.conflictstyle = "diff3";
      "merge \"mergiraf\"" = {
        name = "mergiraf";
        driver = "mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P";
      };
      url = {
        "git@github.com:".insteadOf = [
          "gh:"
          "https://github.com/"
        ];
      };
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  home.packages = [
    pkgs.gh
    pkgs.mergiraf
  ];

  home.file.".gitattributes".source = ./gitattributes;

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
  };
}
