{
  host,
  inputs,
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../options.nix
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    inputs.fw-fanctrl.nixosModules.default
    ../../modules/nixos/common.nix
    ../../modules/nixos/bootloaders/systemd-boot.nix
    ../../modules/nixos/greeters/greetd.nix
    ../../modules/nixos/virtualisation/docker.nix
    ./stylix.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.supportedFilesystems = ["ntfs"];

  nixpkgs.overlays = [inputs.claude-code.overlays.default];

  # enable quickshell for noctalia shell
  environment.systemPackages = [
    (inputs.quickshell.packages.${pkgs.system}.default.override {
      withJemalloc = true;
      withQtSvg = true;
      withWayland = true;
      withX11 = false;
      withPipewire = true;
      withPam = true;
      withHyprland = true;
      withI3 = false;
    })
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

  home-manager.users.${username} = import ./home.nix;

  hardware.bluetooth.enable = true;

  networking.hostName = "${host}";
  networking.networkmanager.enable = true;

  services = {
    openssh.enable = true;
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

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
  '';

  programs.fw-fanctrl = {
    enable = true;
    config = {
      defaultStrategy = "lazy";
      strategies = {
        "lazy" = {
          fanSpeedUpdateFrequency = 5;
          movingAverageInterval = 30;
          speedCurve = [
            {
              temp = 0;
              speed = 15;
            }
            {
              temp = 50;
              speed = 15;
            }
            {
              temp = 65;
              speed = 25;
            }
            {
              temp = 70;
              speed = 35;
            }
            {
              temp = 75;
              speed = 50;
            }
            {
              temp = 85;
              speed = 100;
            }
          ];
        };
      };
    };
  };
}
