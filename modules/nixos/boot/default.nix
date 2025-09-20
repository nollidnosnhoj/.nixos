{
  config,
  host,
  lib,
  pkgs,
  self,
  ...
}: {
  stylix.targets.plymouth = {
    enable = true;
    logo = "${self}/.assets/NixOS.png";
    logoAnimated = true;
  };

  boot.plymouth = {
    enable = true;
    # theme = lib.mkForce "dark_planet";
    # themePackages = [pkgs.adi1090x-plymouth-themes];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages;
    lib.mkIf (host == "framework16") [framework-laptop-kmod];
}
