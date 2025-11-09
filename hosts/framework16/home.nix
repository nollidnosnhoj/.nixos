{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home/browsers/zen.nix
    ../../modules/home/development.nix
    ../../modules/home/discord.nix
    ../../modules/home/editors/neovim
    ../../modules/home/editors/vscode
    ../../modules/home/programs/cli.nix
    ../../modules/home/programs/gui.nix
    ../../modules/home/terminals/foot.nix
    ../../modules/home/terminals/ghostty.nix
    ../../modules/home/git.nix
    ../../modules/home/scripts
    ../../modules/home/shell
    ../../modules/home/xdg-mimes.nix
  ];
  services = {
    easyeffects = {
      enable = true;
      preset = "easyeffect_fw16";
    };
  };

  home = {
    packages = with pkgs; [
      nvtopPackages.amd # task monitor for AMD GPU
    ];
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "zen-twilight";
      TERMINAL = "foot";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs.keychain = {
    enable = true;
    enableFishIntegration = true;
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
