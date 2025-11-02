{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
  ];

  zramSwap = {
    enable = true;
    algorithm = "lz4";
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
}
