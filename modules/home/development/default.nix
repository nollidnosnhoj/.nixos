{
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./git.nix
    ./nvf.nix
  ];
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    # Bash
    nodePackages.bash-language-server

    # C
    gcc

    # Javascript/Typescript
    nodejs
    vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.prettier
    prettierd
    eslint_d

    # Tooling
    devenv
    gopls
    markdown-oxide

    # Kubernetes
    kubectl
    kustomize
  ];

  programs.bun = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.go = {
    enable = true;
  };

  programs.opencode = {
    enable = true;
    package = inputs.opencode.packages.${pkgs.system}.default;
  };

  home.sessionPath = [
    "/home/${username}/.local/bin"
    "/home/${username}/go/bin"
  ];
}
