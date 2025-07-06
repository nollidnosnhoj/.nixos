{
  inputs,
  pkgs,
  self,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ../../modules/nixos
    ../../options
  ];

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEny0zOiDgAoU2RLujAiI/7a3r6RFUOpuGpuNQ4osn97 me@nollidnosnhoj.com"
      ];
    };
  };

  # Enabling it causes the build to be slow if you're using fish
  documentation.man.generateCaches = false;

  home-manager.users.${username} = import ./home.nix;

  services = {
    fprintd.enable = true;
    power-profiles-daemon.enable = true;

    logind = {
      powerKey = "suspend";
      lidSwitch = "suspend";
      lidSwitchExternalPower = "lock";
    };

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
  };

  is-laptop = true;

  desktop = {
    wallpaper = "${self}/.assets/wallpapers/wallpaper-material-dark.jpg";
    palette = "${pkgs.base16-schemes}/share/themes/material-darker.yaml";
  };
}
