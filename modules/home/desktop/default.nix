{pkgs, ...}: {
  imports = [
    ./swaync
    ./hypridle.nix # idle
    ./hyprlock.nix # lock screen
    ./hyprpaper.nix # wallpaper
    ./fuzzel.nix
    ./waybar
    ./wlogout.nix
    ./niri.nix
  ];

  home.packages = with pkgs; [
    slurp
    wl-clipboard
    wl-clip-persist
    glib
    wayland
    direnv
    brightnessctl
    playerctl
    wireplumber
    poweralertd
    libnotify
  ];
}
