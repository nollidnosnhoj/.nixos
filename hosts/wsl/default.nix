# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, host, inputs, lib, pkgs, username, ... }:

{
  imports = [
    ../../modules/nixos/user.nix
  ];

  networking.hostName = "${host}";

  wsl = {
    enable = true;
    defaultUser = "${username}";
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    startMenuLaunchers = true;
    docker-desktop.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune.enable = true;
  };

  programs = {
    zsh.enable = true;
    nix-ld.enable = true;
    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 7d --keep 5";
      };
      flake = "/home/${username}/.nixos";
    };
  };

  environment = {
    systemPackages = with pkgs; [
      wget
      git
      curl
      just
    ];
    pathsToLink = ["/share/zsh"];
    shells = [pkgs.zsh];
    enableAllTerminfo = true;
  };

  security.sudo.wheelNeedsPassword = false;

  users.users.${username}.extraGroups = ["wheel"];

  home-manager.users.${username}.imports = [./home.nix];

  nix = {
    settings = {
      trusted-users = ["${username}"];
      # FIXME: use your access tokens from secrets.json here to be able to clone private repos on GitHub and GitLab
      # access-tokens = [
      #   "github.com=${secrets.github_token}"
      #   "gitlab.com=OAuth2:${secrets.gitlab_token}"
      # ];

      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  # Set your time zone.
  time.timeZone = "Pacific/Honolulu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}