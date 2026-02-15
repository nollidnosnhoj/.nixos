{username, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/nixos-desktop-base.nix
  ];

  home-manager.users.${username} = import ./home.nix;
}
