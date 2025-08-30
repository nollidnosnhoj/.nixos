{
  pkgs,
  username,
  ...
}: {
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus = {
      enable = true;
      implementation = "broker";
      packages = with pkgs; [
        gcr
        gnome-settings-daemon
        libsecret
      ];
    };
    logind.settings.Login = {
      HandlePowerkey = "ignore";
    };
    udisks2.enable = true;
    syncthing = {
      enable = true;
      user = "${username}";
      dataDir = "/home/${username}/Sync/";
    };
  };
}
