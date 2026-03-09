{pkgs, ...}: {
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
    fastfetch = {
      enable = true;
      settings = {
        display = {
          separator = " ➜  ";
        };
        modules = [
          "break"
          "break"
          "break"
          {
            type = "os";
            key = "OS   ";
            keyColor = "31";
          }
          {
            type = "kernel";
            key = " ├  ";
            keyColor = "31";
          }
          {
            type = "shell";
            key = " └  ";
            keyColor = "31";
          }
          "break"
          {
            type = "wm";
            key = "WM   ";
            keyColor = "32";
          }
          {
            type = "terminal";
            key = " ├  ";
            keyColor = "32";
          }
          "break"
          {
            type = "host";
            format = "{5} {2}";
            key = "PC   ";
            keyColor = "33";
          }
          {
            type = "cpu";
            format = "{1} @ {7}";
            key = " ├  ";
            keyColor = "33";
          }
          {
            type = "gpu";
            format = "{2}";
            key = " ├ 󰢮 ";
            keyColor = "33";
          }
          {
            type = "memory";
            key = " ├  ";
            keyColor = "33";
          }
          {
            type = "disk";
            key = " ├ 󰋊 ";
            keyColor = "33";
          }
          "break"
          "break"
        ];
      };
    };
  };
}