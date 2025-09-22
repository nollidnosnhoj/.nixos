{pkgs, ...}: {
  services = {
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;
    };
    udev.packages = with pkgs; [
      gnome-settings-daemon
    ];
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gtk-engine-murrine
    gnomeExtensions.dash-to-dock
    gnomeExtensions.paperwm
    gnomeExtensions.vertical-workspaces
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.dash-to-panel
    gnomeExtensions.appindicator
    dconf
    dconf-editor
  ];
}
