{pkgs, ...}: {
  home.packages = with pkgs; [swayosd];
  services.swayosd.enable = true;
  services.swayosd.package = pkgs.swayosd;
}
