{ pkgs, ... }:
{
  home.packages = with pkgs; [
    asciinema
    asciinema-agg
    binsider
    caligula # User-friendly, lightweight TUI for disk imaging
    dysk # disk information
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    ffmpeg
    file # Show file information
    gtt # google translate TUI
    gtrash # rm replacement, put deleted files in system trash
    htop
    imagemagick
    imv # image viewer
    jq # JSON processor
    killall
    man-pages # extra man pages
    mimeo
    mpv # video player
    ncdu # disk space
    nitch # systhem fetch util
    openssl
    onefetch # fetch utility for git repo
    pamixer # pulseaudio cli mixer
    ripgrep # grep replacement
    shfmt # bash formatter
    swappy # snapshot editing tool
    tdf # cli pdf viewer
    treefmt # project formatter
    tldr
    unzip
    wavemon # monitoring for wireless network devices
    wget
    xdg-utils
    xxd
  ];
}
