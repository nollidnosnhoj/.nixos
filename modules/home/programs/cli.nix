{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-cli # password manager CLI
    dysk # disk information
    entr # perform action when file change
    eza # ls replacement
    fd # find replacement
    ffmpeg # audio/video tool
    file # Show file information
    gnumake # makefile
    gtrash # rm replacement, put deleted files in system trash
    imagemagick # image manipulation
    jq # JSON processor
    just # justfile
    lsd # modern ls
    man-pages # extra man pages
    mimeo
    ncdu # disk space
    onefetch # fetch utility for git repo
    openssl
    playerctl # CLI for controlling media players
    ripgrep # grep replacement
    shfmt # bash formatter
    superfile
    tdf # cli pdf viewer
    tldr
    treefmt # project formatter
    xdg-utils
  ];
}
