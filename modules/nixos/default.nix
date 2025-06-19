{host, ...}: {
  imports = [
    ./bootloader.nix
    ./greetd.nix
    ./hardware
    ./home-manager.nix
    ./networking.nix
    ./nh.nix
    ./pipewire.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./swayosd.nix
    ./system.nix
    ./thunar.nix
    ./xdg.nix
    ./xserver.nix
  ];

  networking.hostName = "${host}";
}
