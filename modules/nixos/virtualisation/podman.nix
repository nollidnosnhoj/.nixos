{
  pkgs,
  username,
  ...
}: {
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.extraGroups.podman.members = ["${username}"];

  environment.systemPackages = with pkgs; [
    podman-desktop
    podman-tui
  ];
}
