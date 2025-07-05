{
  self,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/podman.nix
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
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDswGYvepIgUEkZIA6tpBlD/drVlxO/CkpY7bmRX+hpO me@nollidnosnhoj.com" # Minisforum MS-A1
      ];
    };
  };

  # Enabling it causes the build to be slow if you're using fish
  documentation.man.generateCaches = false;

  home-manager.users.${username} = import ./home.nix;

  powerManagement.cpuFreqGovernor = "performance";

  desktop = {
    wallpaper = "${self}/.assets/wallpapers/wallpaper-material-dark.jpg";
    palette = "${pkgs.base16-schemes}/share/themes/material-darker.yaml";
  };

  input = {
    mouse-sensivity = -0.2;
  };
}
