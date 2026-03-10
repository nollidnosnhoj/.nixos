{username, ...}: {
  imports = [
    ../../modules/home/development
    ../../modules/home/programs/default-cli.nix
    ../../modules/home/programs/default-gui.nix
    ../../modules/home/shell
    ../../modules/home/niri
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
