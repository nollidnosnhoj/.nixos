{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Utility
    dconf-editor
    mission-center # GUI resources monitor
    zenity

    evince # pdf
    gnome-text-editor # gedit
    gnome-calendar # calendar

    imv # image viewer
    (mpv.override {
      scripts = [
        mpvScripts.uosc
        mpvScripts.thumbfast
        mpvScripts.mpris
      ];
    }) # media player

    bitwarden-desktop # password manager

    libreoffice # office
    obsidian # note taking app
  ];
}
