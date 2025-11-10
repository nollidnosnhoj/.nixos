{pkgs, ...}: {
  services.mullvad-vpn.enable = true;
  environment.systemPackages = with pkgs; [
    mullvad-browser
    mullvad-vpn
  ];
}
