{pkgs, ...}: {
  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;

  environment.systemPackages = with pkgs; [
    usbutils
  ];
}
