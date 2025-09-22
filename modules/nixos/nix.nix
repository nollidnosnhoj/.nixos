{
  inputs,
  pkgs,
  username,
  ...
}: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      download-buffer-size = 52428800;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = ["root" "@wheel" "${username}"];
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
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        nur = import inputs.nur {
          nurpkgs = prev;
          pkgs = prev;
        };
      })
    ];
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d --keep 5";
    };
    flake = "/home/${username}/.nixos";
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [stdenv.cc.cc];
  };

  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
    nixVersions.latest
    nix-prefetch-git
    nixfmt-rfc-style
    nixos-anywhere
  ];
}
