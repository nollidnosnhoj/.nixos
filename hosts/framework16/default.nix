{ username, ... }:
{
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
    (builtins.replaceStrings [ "\n" ] [ "" ] (builtins.readFile ../../keys/kopa_ed25519.pub))
  ];

  environment.variables = {
    EDITOR = "nvim";
  };
}
