{
  config,
  host,
  inputs,
  lib,
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../options.nix
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-16-7040-amd
    ../../modules/nixos/common.nix
    ../../modules/nixos/bootloaders/systemd-boot.nix
    ../../modules/nixos/greeters/greetd.nix
    ../../modules/nixos/virtualisation/docker.nix
    ./stylix.nix
  ];

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
    pkgs.framework-tool
    pkgs.cpupower-gui
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

  fonts.packages = with pkgs; [
    # Required for noctolia shell
    roboto
    inter
    material-symbols
  ];

  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
  };

  nixpkgs.overlays = [
    inputs.claude-code.overlays.default
    inputs.nix-vscode-extensions.overlays.default
  ];

  hardware = {
    bluetooth.enable = true;
    fw-fanctrl = {
      enable = true;
      package = pkgs.fw-fanctrl.overrideAttrs (finalAttrs: prevAttrs: {
        patches = (prevAttrs.patches or []) ++ [./fw-fanctrl.patch];
      });
      config = {
        defaultStrategy = "lazy";
      };
    };
    keyboard.qmk.enable = true;
  };

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

    udev.extraRules = ''
      SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
      SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    '';
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = {
      btrfs = true;
      ntfs = true;
      zfs = lib.mkForce false;
    };
    extraModulePackages = with config.boot.kernelPackages;
      [
        cpupower
        framework-laptop-kmod
      ]
      ++ [pkgs.cpupower-gui];
  };
}
