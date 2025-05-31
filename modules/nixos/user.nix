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
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPWqCDUOQLGX3ajsocvg8IoEuAabhq9HYb1WeHSZ1Xtu me@nollidnosnhoj.com"
      ];
    };
  };
  nix.settings.allowed-users = [ "${username}" ];
}
