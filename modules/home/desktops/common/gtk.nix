{ pkgs, ... }:
{
  # Other GTK settings are handled by stylix
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override { color = "black"; };
    };
  };
}
