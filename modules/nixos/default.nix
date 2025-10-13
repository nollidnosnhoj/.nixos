{...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./audio.nix
    ./boot
    ./desktop
    ./hardware
    ./network.nix
    ./nix.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sops.nix
    ./system.nix
    ./user.nix
    ./xserver.nix
    ./virtualisation
    ./vpn.nix
  ];
}
