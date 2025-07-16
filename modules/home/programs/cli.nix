{pkgs, ...}: {
  home.packages = with pkgs; [
    bitwarden-cli # password manager CLI
    direnv
    dysk # disk information
    eza # ls replacement
    entr # perform action when file change
    fd # find replacement
    ffmpeg
    file # Show file information
    gtrash # rm replacement, put deleted files in system trash
    htop
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

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
