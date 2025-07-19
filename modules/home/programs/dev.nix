{
  pkgs,
  username,
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

  home.sessionPath = [
    "/home/${username}/go/bin"
  ];
}
