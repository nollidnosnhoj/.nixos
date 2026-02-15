{username, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./framework.nix
    ../common/nixos-desktop-base.nix
  ];

  home-manager.users.${username} = import ./home.nix;
}
