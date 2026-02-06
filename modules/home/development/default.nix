{
  pkgs,
  username,
  ...
}: {
  imports = [
    ./claude-code.nix
    ./opencode.nix
  ];
  home.packages = with pkgs; [
    # Nix
    nixd
    alejandra

    # Bash
    nodePackages.bash-language-server

    # C
    gcc

    # .NET
    dotnet-sdk_10

    # Javascript/Typescript
    nodejs_22
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

  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_10}";
    DOTNET_CLI_TELEMETRY_OPTOUT = "1";
  };

  home.sessionPath = [
    "/home/${username}/.local/bin"
    "/home/${username}/go/bin"
    "/home/${username}/.dotnet/tools"
  ];
}
