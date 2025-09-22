{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
    xwayland
    poweralertd
    libnotify
  ];

  zramSwap = {
    enable = true;
    algorithm = "lz4";
  };

  # Avoid freezing the system under memory pressure
  services.earlyoom.enable = true;
  services.earlyoom.enableNotifications = true; # Possible DoS vector if untrusted users on same pc.

  system.stateVersion = "25.05";
}
