{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libva
      vaapiVdpau
      libvdpau-va-gl
      mesa
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
