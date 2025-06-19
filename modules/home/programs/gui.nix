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

    chatterino2 # Twitch chat GUI
  ];
}
