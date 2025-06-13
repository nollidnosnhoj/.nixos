{ ... }:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "xwayland-satellite" ]; }
    { command = [ "swww-daemon" ]; }
    { command = [ "swaync" ]; }
    {
      command = [
        "walker"
        "--gapplication-service"
      ];
    }
    { command = [ "swayosd-server" ]; }
  ];
}
