{
  inputs,
  lib,
  username,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
    inputs.chaotic.nixosModules.default
    ./hardware-configuration.nix
    ./framework.nix
    ../../modules/nixos
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
}
