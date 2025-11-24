{pkgs, ...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./gdm.nix
    ./gnome.nix
    ./nautilus.nix
    ./niri.nix
    ./noctalia.nix
    ./xserver.nix
  ];

  environment.systemPackages = with pkgs; [
    libnotify
  ];
}
