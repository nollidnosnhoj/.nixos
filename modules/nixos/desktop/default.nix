{pkgs, ...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./niri
    ./noctalia.nix
    ./gdm.nix
    ./gnome.nix
    ./nautilus.nix
  ];

  environment.systemPackages = with pkgs; [
    xwayland
    poweralertd
    libnotify
    xdg-utils
  ];
}
