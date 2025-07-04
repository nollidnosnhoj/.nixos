{
  config,
  pkgs,
  ...
}: let
  wallpaper = config.stylix.image;
in {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];}
    {
      command = [
        "swww"
        "img"
        "${wallpaper}"
      ];
    }
  ];
}
