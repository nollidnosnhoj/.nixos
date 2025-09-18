{...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./boot
    ./desktop.nix
    ./greetd.nix
    ./hardware
    ./nautilus.nix
    ./network.nix
    ./pipewire.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sops.nix
    ./stylix.nix
    ./system.nix
    ./user.nix
    ./xserver.nix
    ./virtualisation
  ];
}
