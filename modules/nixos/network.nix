{host, ...}: {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.enable = true;
    enableIPv6 = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}
