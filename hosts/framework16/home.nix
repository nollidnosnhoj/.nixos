{username, ...}: {
  imports = [
    ../../modules/home/browsers
    ../../modules/home/discord.nix
    ../../modules/home/development
    ../../modules/home/development/gui.nix
    ../../modules/home/discord.nix
    ../../modules/home/editors/neovim
    ../../modules/home/editors/vscode
    ../../modules/home/editors/zed
    ../../modules/home/foot.nix
    ../../modules/home/git.nix
    ../../modules/home/programs
    ../../modules/home/scripts
    ../../modules/home/shell
    ../../modules/home/udiskie.nix
    ../../modules/home/xdg-mimes.nix
  ];
  services = {
    easyeffects = {
      enable = true;
      preset = "easyeffect_fw16";
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "zen-twilight";
      TERMINAL = "foot";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs.keychain = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    keys = ["id_ed25519"];
  };

  programs.git = {
    signing.key = "~/.ssh/id_ed25519.pub";
    extraConfig = {
      core = {
        attributesfile = "~/.gitattributes";
        sshCommand = "ssh -i /home/${username}/.ssh/id_ed25519";
      };
      gpg = {
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
    };
  };
}
