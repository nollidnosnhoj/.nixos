{
  inputs,
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

    # AI
    claude-code
    inputs.opencode.packages.${pkg.system}.default

    devenv
    markdown-oxide
    gh
  ];

  home.sessionPath = [
    "/home/${username}/.local/bin"
    "/home/${username}/go/bin"
  ];
}
