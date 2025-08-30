{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Utility
    dconf-editor
    mission-center # GUI resources monitor
    zenity

    evince # pdf
    gnome-text-editor # gedit
    gnome-calendar # calendar

    bitwarden # password manager

    libreoffice
    obsidian
    pavucontrol
  ];
}
