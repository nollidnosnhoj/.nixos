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

    postman # api testing

    bitwarden # password manager

    (calibre.override {
      unrarSupport = true;
    })
  ];
}
