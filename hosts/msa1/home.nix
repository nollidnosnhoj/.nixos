{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home/dev.nix
    ../../modules/home/git.nix
    ../../modules/home/nvf.nix
    ../../modules/home/programs.nix
    ../../modules/home/shell.nix
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
