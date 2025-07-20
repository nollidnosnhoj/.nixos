{pkgs}: {
  browser = "${pkgs.firefox}/bin/firefox";
  terminal = "${pkgs.foot}/bin/foot";
  file-manager = "${pkgs.nautilus}/bin/nautilus";
  app-launcher = "${pkgs.fuzzel}/bin/fuzzel";
  lock-screen = "${pkgs.hyprlock}/bin/hyprlock";
}
