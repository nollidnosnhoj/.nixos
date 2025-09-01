{...}: {
  # Place modules you want all x-top machines to have.
  imports = [
    ./bootloaders/systemd-boot.nix
    ./desktop.nix
    ./greeters/greetd.nix
    ./hardware
    ./nautilus.nix
    ./network.nix
    ./nh.nix
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
