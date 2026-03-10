{
  inputs,
  pkgs,
  username,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    unzip

    #nix related
    nix-output-monitor
    nvd
    nixVersions.latest
    nix-prefetch-git
    nixfmt
    nixos-anywhere
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nix.settings = {
    auto-optimise-store = true;
    download-buffer-size = 52428800;
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://cache.nixos.org?priority=10"
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"
      "https://devenv.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
    trusted-users = ["root" "@wheel" "${username}"];
  };

  environment.variables.NH_FLAKE = "/home/${username}/.nixos";

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };

  programs.nix-ld.enable = true;
  
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
