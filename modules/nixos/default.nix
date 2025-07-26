{host, ...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./bootloader.nix
    ./flatpak.nix
    ./greetd.nix
    ./hardware
    ./home-manager.nix
    ./nautilus.nix
    ./networking.nix
    ./nh.nix
    ./pipewire.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./swayosd.nix
    ./system.nix
    ./vpn.nix
    ./xdg.nix
    ./xserver.nix
  ];

  networking.hostName = "${host}";
}
