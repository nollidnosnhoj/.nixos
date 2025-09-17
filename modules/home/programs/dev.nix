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

    # kubernetes
    kubectl
    minikube
  ];

  home.sessionPath = [
    "/home/${username}/go/bin"
  ];
}
