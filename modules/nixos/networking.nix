{
  pkgs,
  host,
  ...
}: {
  networking = {
    hostName = "${host}";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  environment.systemPackages = with pkgs; [networkmanagerapplet];
}
