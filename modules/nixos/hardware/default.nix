{pkgs, ...}: {
  imports = [
    ./graphics.nix
  ];
  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;
  programs.light.enable = true;

  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
