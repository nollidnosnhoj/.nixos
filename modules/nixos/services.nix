{pkgs, ...}: {
  services = {
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
        libsecret
      ];
    };
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    logind.settings.Login.HandlePowerkey = "ignore";
    pcscd.enable = true;
    udev.packages = with pkgs; [
      qmk-udev-rules
      yubikey-personalization
    ];
    udisks2.enable = true;
  };
}
