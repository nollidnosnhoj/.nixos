{
  config,
  inputs,
  pkgs,
  ...
}: let
  wallpaper = config.stylix.image;
  swww = inputs.swww.packages.${pkgs.system}.swww;
in {
  programs.niri.settings.spawn-at-startup = [
    {command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];}
    {command = ["${swww}/bin/waybar"];}
    {
      command = [
        "swww"
        "img"
        "${wallpaper}"
      ];
    }
  ];
}
