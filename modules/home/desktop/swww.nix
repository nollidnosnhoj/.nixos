{
  inputs,
  pkgs,
  ...
}: {
  services.swww.enable = true;
  services.swww.package = inputs.swww.packages.${pkgs.system}.swww;
}
