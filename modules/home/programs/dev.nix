{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    devenv # development envirronment
    go # golang
    gnumake # make command
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
