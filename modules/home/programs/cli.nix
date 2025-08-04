{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-cli # password manager CLI
    dysk # disk information
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    file # Show file information
    gtrash # rm replacement, put deleted files in system trash
    imagemagick
    imv # image viewer
    jq # JSON processor
    just
    killall
    man-pages # extra man pages
    mimeo
    mpv # video player
    ncdu # disk space
    openssl
    onefetch # fetch utility for git repo
    pamixer # pulseaudio cli mixer
    ripgrep # grep replacement
    shfmt # bash formatter
    tdf # cli pdf viewer
    treefmt # project formatter
    tldr
    xdg-utils
    xxd
  ];
}
