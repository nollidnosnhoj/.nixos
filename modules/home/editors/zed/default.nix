{pkgs, ...}: {
  home.packages = with pkgs; [zed-editor];

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
    extensions = ["nix"];
    userSettings = {
      base_keymap = "VSCode";
      languages = {
        Nix = {
          language_servers = [
            "nixd"
            "!nil"
          ];
          formatter = {
            external.command = "alejandra";
          };
        };
      };
      lsp = {
        nixd = {
          binary = {
            path = "/usr/bin/env";
            arguments = ["nixd"];
          };
          initialization_options = {
            formatting = {
              command = "alejandra";
            };
          };
          settings = {
            diagnostic = {
              suppress = [
                "sema-extra-with"
              ];
            };
          };
        };
      };
    };
  };
}
