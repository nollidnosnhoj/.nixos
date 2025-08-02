{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Multimedia
    pavucontrol

    ## Utility
    dconf-editor
    mission-center # GUI resources monitor
    zenity

    evince # pdf
    gnome-text-editor # gedit
    gnome-calendar # calendar

    bitwarden # password manager
  ];
}
