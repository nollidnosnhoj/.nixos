{
  self,
  config,
  pkgs,
  ...
}: {
  boot = {
    supportedFilesystems = ["ntfs"];
    kernelPackages = pkgs.linuxPackages_cachyos;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true;
    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };

  environment.systemPackages = [
    config.boot.kernelPackages.cpupower
  ];

  systemd.services.nix-daemon = {
    environment = {
      TMPDIR = "/var/tmp";
    };
  };

  stylix.targets.plymouth = {
    enable = true;
    logo = "${self}/.assets/NixOS.png";
    logoAnimated = true;
  };
}
