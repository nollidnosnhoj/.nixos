{...}: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    libinput.enable = true;
  };

  console = {
    useXkbConfig = true;
  };

  # To prevent getting stuck at shutdown
  systemd.settings.Manager = {
    DefaultIOAccounting = true;
    DefaultIPAccounting = true;
    DefaultTimeoutStopSec = "10s";
  };
}
