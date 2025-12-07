{
  inputs,
  pkgs,
  ...
}: let
  chromiumFlags = import ./chromium-flags.nix {inherit pkgs;};
in {
  home.packages = [
    inputs.linuxmobilepkgs.packages.${pkgs.system}.helium
  ];
  home.sessionVariables = chromiumFlags.sessionVariables;
}
