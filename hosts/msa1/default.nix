{
  self,
  pkgs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
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
    shell = pkgs.fish;
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEST2NyoWDsIf6Eum6T0afSDzKGnLC+xlVrMoPxnlmAm me@nollidnosnhoj.com" # Minisforum MS-A1
        # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEny0zOiDgAoU2RLujAiI/7a3r6RFUOpuGpuNQ4osn97 me@nollidnosnhoj.com" # Framework 16
      ];
    };
  };

  # Enabling it causes the build to be slow if you're using fish
  documentation.man.generateCaches = false;

  home-manager.users.${username} = import ./home.nix;

  powerManagement.cpuFreqGovernor = "performance";

  desktop = {
    wallpaper = "${self}/.assets/wallpapers/one-punch-man.png";
  };

  input = {
    mouse-sensivity = -0.2;
  };
}
