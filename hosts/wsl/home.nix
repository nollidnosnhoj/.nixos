{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home/git.nix
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
