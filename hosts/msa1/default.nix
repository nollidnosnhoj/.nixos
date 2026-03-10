# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  host,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/desktop/niri.nix
    ../../modules/nixos/network.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/system.nix
    ../../modules/nixos/user.nix
    ../../modules/nixos/virtualization.nix
    ../../modules/nixos/xserver.nix
  ];

  networking.hostName = "${host}"; # Define your hostname.

  home-manager.users.${username} = import ./home.nix;

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINl96lpRZvRv5f66o2GAWOsdpATwGfwL5IGOSyBvgaVt kopa@msa1"
  ];

  # Install firefox.
  programs.firefox.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
