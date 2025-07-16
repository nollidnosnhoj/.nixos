{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    protonmail-bridge-gui
  ];
  services.protonmail-bridge.enable = true;
}
