{pkgs, ...}: {
  imports = [./limine.nix];

  boot = {
    loader.efi.canTouchEfiVariables = true;
    plymouth.enable = true;
    kernelPackages = pkgs.linuxPackages_cachyos;
  };

  services.scx.enable = true;
}
