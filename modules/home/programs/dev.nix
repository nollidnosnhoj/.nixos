{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nixd
    nixfmt-rfc-style
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
