{
  inputs,
  pkgs,
  self,
  username,
  ...
}: let
  noctaliaPath = "${self}/modules/nixos/desktop/config/noctalia";
in {
  # systemd
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  home-manager.users.${username} = {
    imports = [
      ({config, ...}: {
        xdg.configFile."noctalia".source = config.lib.file.mkOutOfStoreSymlink noctaliaPath;
      })
    ];
  };
}
