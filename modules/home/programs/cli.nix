{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-cli # password manager CLI
    dysk # disk information
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    ffmpeg
    file # Show file information
    gtrash # rm replacement, put deleted files in system trash
    imagemagick
    imv # image viewer
    jq # JSON processor
    killall
    lsd # modern ls
    man-pages # extra man pages
    mimeo
    (mpv.override {
      scripts = [
        mpvScripts.uosc
        mpvScripts.thumbfast
        mpvScripts.mpris
      ];
    })
    ncdu # disk space
    openssl
    onefetch # fetch utility for git repo
    ripgrep # grep replacement
    shfmt # bash formatter
    superfile
    tdf # cli pdf viewer
    treefmt # project formatter
    tldr
    xdg-utils
    xxd
  ];
}
