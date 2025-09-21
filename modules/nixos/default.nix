{...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./audio.nix
    ./boot
    ./desktop/niri
    ./desktop/noctalia.nix
    ./greetd.nix
    ./hardware
    ./nautilus.nix
    ./network.nix
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
