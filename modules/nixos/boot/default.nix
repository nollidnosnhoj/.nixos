{
  pkgs,
  self,
  ...
}: {
  stylix.targets.plymouth = {
    enable = true;
    logo = "${self}/.assets/NixOS.png";
    logoAnimated = true;
  };

  boot = {
    plymouth.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
