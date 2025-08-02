{
  pkgs,
  username,
  ...
}: {
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    gnumake # make command

    go # golang
    gopls
  ];

  home.sessionPath = [
    "/home/${username}/go/bin"
  ];
}
