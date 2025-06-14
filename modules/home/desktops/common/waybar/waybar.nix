{ pkgs, ... }:
{
  programs.waybar.enable = true;
  programs.waybar.package = pkgs.waybar;
}
