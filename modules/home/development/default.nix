{
  pkgs,
  username,
  ...
}: {
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    # Bash
    nodePackages.bash-language-server

    # Golang
    gcc
    go
    gopls

    # Javascript/Typescript
    nodejs_22
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.prettier
    prettierd
    eslint_d
    bun
    markdown-oxide

    # AI
    claude-code

    # Kubernetes
    kubectl
    minikube

    devenv
  ];

  home.sessionPath = [
    "/home/${username}/go/bin"
  ];
}
