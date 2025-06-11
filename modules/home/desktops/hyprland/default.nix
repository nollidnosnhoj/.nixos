{ inputs, ... }:
{
  imports = [
    ./hyprland.nix
    ./config.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./variables.nix
    inputs.hyprland.homeManagerModules.default
    ../common/swaync
    ../common/waybar
    ../common/gtk.nix
    ../common/swayosd.nix
    ../common/walker.nix
    # ../common/waypaper.nix
    ../common/wlogout.nix
  ];
}
