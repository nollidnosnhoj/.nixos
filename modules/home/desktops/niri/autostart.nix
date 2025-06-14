{ ... }:
{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "xwayland-satellite" ]; }
    { command = [ "swww-daemon" ]; }
    { command = [ "swaync" ]; }
    { command = [ "waybar" ]; }
    {
      command = [
        "walker"
        "--gapplication-service"
      ];
    }
  ];
}
