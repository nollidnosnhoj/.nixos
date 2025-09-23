{
  pkgs,
  username,
  ...
}: {
  nix = {
    settings = {
      download-buffer-size = 52428800;
      auto-optimise-store = true;
      trusted-users = ["root" "@wheel" "${username}"];
    };
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
