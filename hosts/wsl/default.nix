# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL
{
  host,
  lib,
  pkgs,
  username,
  ...
}: let
  inherit (lib) mkForce;
in {
  imports = [
    ../../modules/nixos/core.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/user.nix
  ];

  networking.hostName = "${host}";

  wsl = {
    enable = true;
    defaultUser = username;
    docker-desktop.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  environment.variables = {
    BROWSER = mkForce "wsl-open";
  };

  environment.systemPackages = with pkgs; [wsl-open];

  programs.nix-ld.enable = true;

  home-manager.users.${username} = import ./home.nix;

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP2ieFj6mYYyynIan2yoldvMGmJbxiw7Od36eUsSbDP9 me@nollidnosnhoj.com"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
