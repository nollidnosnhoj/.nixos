{pkgs, ...}: {
  home.packages = with pkgs; [swaynotificationcenter];

  imports = [./config.nix ./style.nix];

  services.swaync = {
    enable = true;
  };
}
