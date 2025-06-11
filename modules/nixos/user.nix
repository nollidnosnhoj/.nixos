{
  pkgs,
  username,
  ...
}:
{
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
    shell = pkgs.fish;
    openssh.authorizedKeys = {
      keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEST2NyoWDsIf6Eum6T0afSDzKGnLC+xlVrMoPxnlmAm me@nollidnosnhoj.com" # Minisforum MS-A1
      ];
    };
  };
  nix.settings.allowed-users = [ "${username}" ];
}
