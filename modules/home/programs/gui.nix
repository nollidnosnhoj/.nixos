{ pkgs, ... }:
{
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
  ];

  dconf.settings = {
    "org/gnome/TextEditor" = {
      custom-font = "Noto Sans Regular 15";
      highlight-current-line = true;
      indent-style = "space";
      restore-session = false;
      show-grid = false;
      show-line-numbers = true;
      show-right-margin = false;
      style-scheme = "builder-dark";
      style-variant = "dark";
      tab-width = "uint32 4";
      use-system-font = false;
      wrap-text = false;
    };
  };
}
