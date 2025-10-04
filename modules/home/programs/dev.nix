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

    # .NET
    dotnet-sdk_9

    # Javascript/Typescript
    nodejs_22
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.prettier
    prettierd
    eslint_d
    bun

    # AI
    claude-code

    # Kubernetes
    kubectl
    minikube

    devenv # developer environment
    gnumake
    just
    markdown-oxide # markdown LSP
  ];

  home.sessionPath = [
    "/home/${username}/go/bin"
  ];
}
