{
  inputs,
  lib,
  pkgs,
  ...
}: let
  opencodePkg = inputs.opencode.packages.${pkgs.system}.default or null;

  opencodeDesktopPkg =
    if inputs.opencode.packages.${pkgs.system}.desktop or null != null
    then
      inputs.opencode.packages.${pkgs.system}.desktop.override {
        opencode = opencodePkg;
      }
    else null;
in {
  home.packages = lib.optional (opencodeDesktopPkg != null) opencodeDesktopPkg;
}
