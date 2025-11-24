{
  lib,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./framework.nix

    ../../modules/nixos/audio.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/boot
    ../../modules/nixos/desktop
    ../../modules/nixos/graphics.nix
    ../../modules/nixos/hardware.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/nix.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/sops.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/virtualisation
    ../../modules/nixos/vpn.nix

    ./theme.nix
  ];

  home-manager.users.${username} = import ./home.nix;

  services = {
    openssh.enable = true;
  };

  boot = {
    supportedFilesystems = {
      btrfs = true;
      ntfs = true;
      zfs = lib.mkForce false;
    };
  };

  # Set your time zone.
  time.timeZone = "Pacific/Honolulu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  environment.variables = {
    EDITOR = "nvim";
  };

  # https://github.com/nixos/nixpkgs/issues/462935
  systemd.user.services.ocra.wantedBy = lib.mkForce [];
  services.orca.enable = lib.mkForce false;
}
