{...}: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["xwayland-satellite"];}
    {command = ["qs"];}
    {command = ["swww-daemon"];}
  ];
}
