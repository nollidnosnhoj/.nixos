{
  host,
  lib,
  pkgs,
  ...
}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs;
      [
        libva
        vaapiVdpau
        libvdpau-va-gl
        mesa
      ]
      ++ lib.optionals (host == "framework16") [amdvlk];
    extraPackages32 = with pkgs.pkgsi686Linux;
      [
        vaapiVdpau
        libvdpau-va-gl
      ]
      ++ lib.optionals (host == "framework16") [amdvlk];
  };
}
