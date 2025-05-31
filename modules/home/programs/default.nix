{ pkgs, ... }:
{
  imports = [
    ./cli.nix
    ./dev.nix
  ];

  home.packages = with pkgs; [
    pavucontrol
  ];
}
