{username, ...}: {
  imports = [
    ../../modules/home/dev.nix
    ../../modules/home/foot.nix
    ../../modules/home/programs.nix
    ../../modules/home/shell.nix
    ../../modules/home/niri
    ../../modules/home/vscode.nix
    ../../modules/home/zen-browser.nix
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
