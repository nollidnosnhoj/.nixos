{
  config,
  lib,
  pkgs,
  ...
}: let
  wallpaper = config.stylix.image;
in {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${lib.getExe pkgs.xwayland-satellite}"];}
    {command = ["${lib.getExe pkgs.waybar}"];}
    {command = ["${lib.getExe pkgs.swww} img ${wallpaper}"];}
  ];
}
