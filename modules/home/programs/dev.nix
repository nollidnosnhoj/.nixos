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
    gcc
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
