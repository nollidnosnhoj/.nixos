{
  nixosConfig,
  pkgs,
  ...
}: let
  wallpaper = nixosConfig.custom.wallpaper;
in {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];}
    {command = ["swww-daemon"];}
    {
      command = [
        "swww"
        "img"
        "${wallpaper}"
      ];
    }
  ];
}
