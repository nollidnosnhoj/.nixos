{pkgs, ...}: {
  imports = [
    ./fuzzel.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./niri
    ./swayosd.nix
    ./swaync
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
    brightnessctl
    playerctl
    wireplumber
    poweralertd
    libnotify
  ];
}
