{
  host,
  pkgs,
  username,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Languages
        jnoortheen.nix-ide
        arrterian.nix-env-selector
        mads-hartmann.bash-ide-vscode
        golang.go

        leonardssh.vscord
        christian-kohler.path-intellisense
        esbenp.prettier-vscode
        mkhl.direnv
      ];
      userSettings = {
        "update.mode" = "none";
        "extensions.autoUpdate" = false; # This stuff fixes vscode freaking out when theres an update
        "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509

        "window.menuBarVisibility" = "toggle";

        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.formatOnPaste" = true;
        "editor.inlayHints.enabled" = "off";

        "editor.mouseWheelZoom" = true;

        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "nix.formatterPath" = "alejandra";
        "nix.serverSettings" = {
          "nixd" = {
            "formatting" = {
              "command" = ["alejandra"];
            };
            "options" = {
              "nixos" = {
                "expr" = "(builtins.getFlake \"/home/${username}/.nixos\").nixosConfigurations.${host}.options";
              };
              "home_manager" = {
                "expr" = "(builtins.getFlake \"/home/${username}/.nixos\").nixosConfigurations.${host}.options.home-manager.users.type.getSubOptions []";
              };
            };
          };
        };
        "nix.hiddenLanguageServerErrors" = [
          "textDocument/definition"
        ];
      };
    };
  };
}
