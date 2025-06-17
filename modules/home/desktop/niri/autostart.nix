{
  lib,
  pkgs,
  ...
}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${lib.getExe pkgs.xwayland-satellite}"];}
    {command = ["${lib.getExe pkgs.waybar}"];}
  ];
}
