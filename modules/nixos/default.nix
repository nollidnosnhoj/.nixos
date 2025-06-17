{inputs, ...}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./bootloader.nix
    ./greetd.nix
    ./hardware.nix
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
    ./user.nix
    ./xserver.nix
  ];
}
