{
  config,
  pkgs,
  ...
}: let
  font = config.stylix.fonts.monospace.name;
in {
  home.packages = with pkgs; [fzf];
  programs.fuzzel = {
    enable = true;
    package = pkgs.fuzzel;
    settings = {
      main = {
        dpi-aware = "no";
        icon-theme = "Papirus-Dark";
        width = 25;
        line-height = 50;
        fields = "name,generic,comment,categories,filename,keywords";
        terminal = "kitty -e";
        show-actions = "yes";
        exit-on-keyboard-focus-loss = "no";
      };
      border = {radius = 20;};
      dmenu = {exit-immediately-if-empty = "yes";};
    };
  };
}
