{username,...}: {
  imports = [
    ../../modules/nixos/nix
    ../../modules/nixos/shell.nix
    ../../modules/nixos/stylix/core.nix
  ];

  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
  };

  # Add ability to use TouchID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    primaryUser = "${username}";
  };
}