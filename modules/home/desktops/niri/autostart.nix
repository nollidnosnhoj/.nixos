{pkgs, ...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["xwayland-satellite"];}
    {command = ["swaync"];}
    {command = ["waybar"];}
    {
      command = ["${pkgs.fuzzel}/bin/fuzzel"];
    }
  ];
}
