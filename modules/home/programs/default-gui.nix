{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bitwarden-desktop
    dconf-editor
    evince
    gnome-calendar
    gnome-text-editor
    libreoffice
    mission-center
    mullvad-browser
    inputs.opencode.packages.${pkg.system}.desktop
    zenity
  ];

  programs = {
    imv = {
      enable = true;
    };
    obsidian = {
      enable = true;
    };
    mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [
        uosc
        thumbfast
        mpris
      ];
    };
  };
}
