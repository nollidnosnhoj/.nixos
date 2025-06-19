{pkgs, ...}: {
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    wireless = {
      iwd = {
        enable = true;
        settings = {
          Settings.AutoConnect = true;
        };
      };
    };
  };

  services.openssh.enable = true;

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
}
