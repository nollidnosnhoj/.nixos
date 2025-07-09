{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    # development envirronment
    devenv
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
