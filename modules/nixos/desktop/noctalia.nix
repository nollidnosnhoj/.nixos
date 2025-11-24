{
  inputs,
  pkgs,
  lib,
  ...
}: let
  # profilePicture = "${self}/.assets/profile.png";
  # wallpaperDir = "${self}/.assets/wallpapers";
  # wallpaper = "${self}/.assets/wallpapers/wallhaven-k8w7dq.png";
in {
  imports = [
    inputs.noctalia.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    (python3.withPackages (pyPkgs: with pyPkgs; [pygobject3]))
  ];
  services.noctalia-shell.enable = true;

  services.gnome.evolution-data-server.enable = true;

  environment.sessionVariables = {
    GI_TYPELIB_PATH = lib.makeSearchPath "lib/girepository-1.0" (
      with pkgs; [
        evolution-data-server
        libical
        glib.out
        libsoup_3
        json-glib
        gobject-introspection
      ]
    );
  };
}
