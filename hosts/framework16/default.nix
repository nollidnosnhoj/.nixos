{username, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./framework.nix

    ../../modules/nixos/audio.nix
    ../../modules/nixos/hardware/bluetooth.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/desktop
    ../../modules/nixos/login
    ../../modules/nixos/hardware/firmware.nix
    ../../modules/nixos/hardware/graphics.nix
    ../../modules/nixos/hm.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/nix
    ../../modules/nixos/power.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/stylix/desktop.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/virtualisation
    ../../modules/nixos/vpn.nix
  ];

  home-manager.users.${username} = import ./home.nix;

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE9sVTgUmhj1MblnK/BI6lu8q2EjCpXCJ82ADHoXdRiD kopa@nixos"
  ];

  environment.variables = {
    EDITOR = "nvim";
  };
}
