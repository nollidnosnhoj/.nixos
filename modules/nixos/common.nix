{...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./flatpak.nix
    ./hardware
    ./home-manager.nix
    ./nautilus.nix
    ./nh.nix
    ./pipewire.nix
    ./programs.nix
    ./security.nix
    ./system.nix
    ./xdg.nix
    ./xserver.nix
  ];
}
