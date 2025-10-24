{
  inputs,
  lib,
  username,
  ...
}: {
  imports = [
    inputs.chaotic.nixosModules.default
    inputs.stylix.nixosModules.stylix
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

  # Set your time zone.
  time.timeZone = "Pacific/Honolulu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  environment.variables = {
    EDITOR = "nvim";
  };
}
