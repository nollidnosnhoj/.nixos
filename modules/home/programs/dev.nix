{
  pkgs,
  username,
  ...
}: {
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    # Golang
    go
    gopls

    # AI
    claude-code

    devenv
    gnumake
    just
  ];

  home.sessionPath = [
    "/home/${username}/go/bin"
  ];
}
