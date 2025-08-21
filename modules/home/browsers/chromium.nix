{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.chromium.override {enableWideVine = true;};
    extensions = [
      "ddkjiahejlhfcafbddmgiahcphecmpfh" # ublock origin
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
    ];
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };
}
