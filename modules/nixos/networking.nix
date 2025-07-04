{...}: {
  networking = {
    networkmanager = {
      enable = true;
      wifi.scanRandMacAddress = false;
    };
  };

  services.openssh.enable = true;
}
