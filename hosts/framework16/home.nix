{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home/browsers/helium.nix
    ../../modules/home/browsers/zen-browser.nix
    ../../modules/home/desktop/niri
    ../../modules/home/desktop/noctalia
    ../../modules/home/development
    ../../modules/home/development/vscode.nix
    ../../modules/home/discord.nix
    ../../modules/home/fuzzel.nix
    ../../modules/home/games
    ../../modules/home/programs/cli
    ../../modules/home/programs/gui
    ../../modules/home/terminals/foot.nix
    ../../modules/home/git.nix
    ../../modules/home/scripts
    ../../modules/home/shell
    ../../modules/home/stylix.nix
    ../../modules/home/xdg-mimes.nix
  ];

  services.easyeffects = {
    enable = true;
    preset = "easyeffect_fw16";
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

  # programs.keychain = {
  #   enable = true;
  #   enableFishIntegration = true;
  #   keys = ["id_ed25519"];
  # };

  programs.git = {
    signing.key = "~/.ssh/id_ed25519.pub";
    settings = {
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
