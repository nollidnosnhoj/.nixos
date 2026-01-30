{pkgs, ...}: let
  chromiumFlags = import ./chromium-flags.nix {inherit pkgs;};
in {
  home.packages = with pkgs; [
    nur.repos.lonerOrz.helium
  ];
  home.sessionVariables = chromiumFlags.sessionVariables;
}
