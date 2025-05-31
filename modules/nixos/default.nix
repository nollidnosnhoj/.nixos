{ ... }:
{
  imports = [
    ./home-manager.nix
    ./bootloader.nix
    ./greetd.nix
    ./hardware.nix
    ./xserver.nix
    ./networking.nix
    ./nh.nix
    ./pipewire.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./thunar.nix
    ./user.nix
    ./wayland.nix
  ];
}
