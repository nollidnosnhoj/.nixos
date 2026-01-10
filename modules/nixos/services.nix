{pkgs, ...}: {
  location.provider = "geoclue2";
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
    geoclue2 = {
      enable = true;
      geoProviderUrl = "https://beacondb.net/v1/geolocate";
      submissionUrl = "https://beacondb.net/v2/geosubmit";
      submissionNick = "geoclue";

      appConfig.gammastep = {
        isAllowed = true;
        isSystem = false;
      };
    };
    gnome.gnome-keyring.enable = true;
    gvfs.enable = true;
    udev.packages = with pkgs; [
      qmk-udev-rules
      yubikey-personalization
    ];
    udisks2.enable = true;
  };
}
