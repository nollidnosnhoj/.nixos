{
  host,
  username,
  ...
}: {
  programs.vscode.profiles.default = {
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
    };
  };
}
