{
  config,
  lib,
  pkgs,
  ...
}: let
  homeDir = config.home.homeDirectory;
  quickshellDir = "${homeDir}/.nixos/modules/home/desktop/quickshell/qml";
  quickshellTarget = "${homeDir}/.config/quickshell";
  faceIconSource = "${homeDir}/.nixos/.assets/profile.png";
  faceIconTarget = "${homeDir}/.face.icon";
in {
  home.activation.symlinkQuickshellAndFaceIcon = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sfn "${quickshellDir}" "${quickshellTarget}"
    ln -sfn "${faceIconSource}" "${faceIconTarget}"
  '';

  home.packages = with pkgs; [
    qt6Packages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects
    kdePackages.qtbase
    kdePackages.qtdeclarative
    kdePackages.qtstyleplugin-kvantum
    wallust
    xdg-desktop-portal-gnome
    material-symbols
    swww
    matugen
    cava
    gpu-screen-recorder
    brightnessctl
    ddcutil
  ];
}
