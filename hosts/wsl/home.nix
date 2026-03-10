{username, ...}: {
  imports = [
    ../../modules/home/development
    ../../modules/home/programs/default-cli.nix
    ../../modules/home/shell
  ];

  programs.git = {
    signing.key = "~/.ssh/id_ed25519.pub";
    settings = {
      core = {
        attributesfile = "~/.gitattributes";
        sshCommand = "ssh -i /home/${username}/.ssh/id_ed25519";
      };
    };
  };
}
