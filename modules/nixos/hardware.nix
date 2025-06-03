{ inputs, pkgs, ... }:
let
  hyprland-pkgs = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  hardware = {
    graphics = {
      enable = true;
      package = hyprland-pkgs.mesa;
    };

    bluetooth = {
      enable = true;
      package = pkgs.bluez;
    };
  };
  hardware.enableRedistributableFirmware = true;
}
