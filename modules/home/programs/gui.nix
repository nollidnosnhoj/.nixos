{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    dconf-editor
    evince
    gnome-calendar
    gnome-text-editor
    imv
    libreoffice
    mission-center
    (mpv.override {
      scripts = [
        mpvScripts.uosc
        mpvScripts.thumbfast
        mpvScripts.mpris
      ];
    })
    obsidian
    zenity
  ];
}
