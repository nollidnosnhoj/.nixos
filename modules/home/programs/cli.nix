{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-cli # password manager CLI
    dysk # disk information
    eza # ls replacement
    entr # perform action when file change
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
    openssl
    onefetch # fetch utility for git repo
    ripgrep # grep replacement
    shfmt # bash formatter
    superfile
    tdf # cli pdf viewer
    treefmt # project formatter
    tldr
  ];
}
