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
    ../../modules/nixos/nix.nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/user.nix
    ./theme.nix
  ];

  wsl = {
    enable = true;
    defaultUser = username;
    docker-desktop.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
  };

  environment = {
    variables = {
      BROWSER = mkForce "wsl-open";
    };
    systemPackages = with pkgs; [
      wget
      git
      curl
      vim
      wsl-open
    ];
  };

  home-manager.users.${username} = import ./home.nix;

  networking = {
    hostName = host;
    tcpcrypt.enable = mkForce false;
  };

  services = {
    smartd.enable = mkForce false;
    xserver.enable = mkForce false;
  };

  programs = {
    nix-ld.enable = true;
    ssh.startAgent = true;
    zsh.enable = true;
  };

  virtualisation.docker.enable = true;
}
