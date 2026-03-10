{pkgs, ...}: {
  imports = [
    ./_fastfetch.nix
  ];
  home.packages = with pkgs; [
    bitwarden-cli # password manager CLI
    dysk # disk information
    entr # perform action when file change
    ffmpeg # audio/video tool
    file # Show file information
    gnumake # makefile
    gtrash # rm replacement, put deleted files in system trash
    imagemagick # image manipulation
    just # justfile
    man-pages # extra man pages
    mimeo
    ncdu # disk space
    onefetch # fetch utility for git repo
    openssl
    playerctl # CLI for controlling media players
    shfmt # bash formatter
    tdf # cli pdf viewer
    tldr
    treefmt # project formatter
    xdg-utils
  ];

  programs = {
    fd.enable = true;
    jq.enable = true;
    ripgrep.enable = true;
    superfile.enable = true;
    btop = {
      enable = true;
      settings = {
        update_ms = 500;
        rounded_corners = false;
      };
    };
    lazygit = {
      enable = true;
      settings.gui.border = "single";
    };
  };
}
