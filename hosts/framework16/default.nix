{
  inputs,
  lib,
  pkgs,
  username,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ./hardware-configuration.nix
    ../../modules/nixos
    ./theme.nix
  ];

  environment.systemPackages = [
    pkgs.framework-tool
  ];

  users.users.${username} = {
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEny0zOiDgAoU2RLujAiI/7a3r6RFUOpuGpuNQ4osn97 me@nollidnosnhoj.com"
      ];
    };
  };

  home-manager.users.${username} = import ./home.nix;

  fonts.packages = with pkgs; [
    # Required for noctolia shell
    roboto
    inter
    material-symbols
  ];

  nixpkgs.overlays = [
    inputs.nix-vscode-extensions.overlays.default
  ];

  hardware = {
    fw-fanctrl = {
      enable = true;
      config = {
        defaultStrategy = "lazy";
      };
    };
    keyboard.qmk.enable = true;
    inputmodule.enable = true;
  };

  services = {
    openssh.enable = true;
    fprintd.enable = true;

    power-profiles-daemon.enable = true;

    logind = {
      settings = {
        Login = {
          HandleLidSwitchExternalPower = "lock";
          HandleLidSwitch = "suspend";
          HandlePowerKey = "suspend";
        };
      };
    };

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    udev.extraRules = ''
      SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
      SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    '';
  };

  boot = {
    supportedFilesystems = {
      btrfs = true;
      ntfs = true;
      zfs = lib.mkForce false;
    };
  };
}
