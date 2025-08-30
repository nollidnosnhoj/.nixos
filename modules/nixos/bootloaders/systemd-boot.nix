{
  config,
  host,
  lib,
  pkgs,
  ...
}: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages;
    lib.mkIf (host == "framework16") [framework-laptop-kmod];
  # services.scx = {
  #   enable = true;
  #   package = pkgs.stable.scx.full;
  #   scheduler = "scx_bpfland";
  # };
}
