{
  pkgs,
  username,
  ...
}: {
  services.mullvad-vpn.enable = true;
  home-manager.users.${username} = {
    home.packages = with pkgs; [mullvad-vpn];
  };
}
