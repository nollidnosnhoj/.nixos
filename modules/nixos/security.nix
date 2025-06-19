{pkgs, ...}: {
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.hyprlock = {};

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.dbus.packages = with pkgs; [
    gcr
    gnome-settings-daemon
    libsecret
  ];
}
