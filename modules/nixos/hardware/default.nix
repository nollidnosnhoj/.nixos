{pkgs, ...}: {
  imports = [
    ./bluetooth.nix
    ./graphics.nix
  ];
  services.fwupd.enable = true;
  hardware.enableRedistributableFirmware = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];
}
