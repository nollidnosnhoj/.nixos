{
  inputs,
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];

  # systemd
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  # services.noctalia-shell.enable = true;

  home-manager.users.${username} = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell.enable = true;
  };
}
