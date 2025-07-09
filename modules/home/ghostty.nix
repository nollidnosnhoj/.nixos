{
  config,
  pkgs,
  ...
}: let
  font = config.stylix.fonts.monospace.name;
in {
  home.packages = with pkgs; [ghostty];
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 11;
      font-family = "${font}";

      window-decoration = false;

      # Disables ligatures
      font-feature = [
        "-liga"
        "-dlig"
        "-calt"
      ];
    };
  };
}
