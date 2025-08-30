{host, ...}: {
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}
