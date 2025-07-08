{pkgs, ...}: {
  home.packages = with pkgs; [swaynotificationcenter];

  imports = [./config.nix];

  services.swaync.enable = true;
}
