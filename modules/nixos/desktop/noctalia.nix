{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.noctalia.nixosModules.default
  ];
  environment.systemPackages = let
    noctalia-shell = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      calendarSupport = true;
    };
  in [
    noctalia-shell
  ];
  # services.noctalia-shell.enable = true;
  services.gnome.evolution-data-server.enable = true;
}
