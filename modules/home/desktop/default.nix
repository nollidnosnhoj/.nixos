{pkgs, ...}: {
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    # ./hyprpaper.nix
    ./niri
    ./swayosd.nix
    ./swaync
    ./swww.nix
    ./waybar
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
    slurp
    wl-clipboard
    wl-clip-persist
    glib
    wayland
    direnv
    playerctl
    poweralertd
    libnotify
  ];
}
