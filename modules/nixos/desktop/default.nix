{...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./niri
    ./noctalia.nix
    ./gdm.nix
    ./gnome.nix
    ./nautilus.nix
  ];
}
