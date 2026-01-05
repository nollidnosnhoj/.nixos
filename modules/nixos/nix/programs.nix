{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    nvd
    nixVersions.latest
    nix-prefetch-git
    nixfmt-rfc-style
    nixos-anywhere
  ];
}
