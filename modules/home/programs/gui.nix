{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Multimedia
    pavucontrol
    soundwireserver

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
    zenity

    evince # pdf
    file-roller # archive
    gnome-text-editor # gedit
    gnome-calendar # calendar

    postman # api testing

    runelite # old school runescape client
    bolt-launcher # alternative to jagex launcher

    bitwarden # password manager
  ];
}
