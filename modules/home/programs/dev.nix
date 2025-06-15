{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
