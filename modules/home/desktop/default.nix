{pkgs, ...}: {
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    # ./hyprpaper.nix
    ./niri
    ./swayosd.nix
    ./swaync
    # ./mako.nix
    ./swww.nix
    ./waybar
  ];

  home.packages = with pkgs; [
    slurp
    wl-clipboard
    wl-clip-persist
    glib
    wayland
    playerctl
    poweralertd
    libnotify
  ];
}
