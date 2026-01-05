{
  host,
  pkgs,
  ...
}: {
  networking = {
    hostName = "${host}";
    firewall.enable = true;
    enableIPv6 = true;
    networkmanager = {
      enable = true;
      wifi.powersave = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.serviceConfig.ExecStart = ["" "${pkgs.networkmanager}/bin/nm-online -q"];
  environment.etc.hosts.enable = false;
}
