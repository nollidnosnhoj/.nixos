{
  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Pacific/Honolulu";

  # compresses half the ram for use as swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };

  # Avoid freezing the system under memory pressure
  services.earlyoom.enable = true;
  services.earlyoom.enableNotifications = true; # Possible DoS vector if untrusted users on same pc.

  # To prevent getting stuck at shutdown
  systemd.settings.Manager = {
    DefaultIOAccounting = true;
    DefaultIPAccounting = true;
    DefaultTimeoutStopSec = "10s";
  };

  # DO NOT UPDATE
  system = {
    switch.enable = true;
    stateVersion = "25.11";
  };
}
