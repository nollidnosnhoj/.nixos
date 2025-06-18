{
  pkgs,
  host,
  ...
}: {
  networking = {
    hostName = "${host}";
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

  # environment.systemPackages = with pkgs; [networkmanagerapplet];
}
