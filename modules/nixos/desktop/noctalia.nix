{
  inputs,
  pkgs,
  ...
}: {
  # systemd
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
  ];
}
