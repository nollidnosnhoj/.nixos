{
  inputs,
  pkgs,
  ...
}: let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  hardware.graphics = {
    enable = true;
    package = hyprland-pkgs.mesa;
  };

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
  };
  hardware.enableRedistributableFirmware = true;

  services.blueman.enable = true;
}
