{
  pkgs,
  lib,
  username,
  ...
}:
with lib; let
  _dotnet-sdk = pkgs.dotnet-sdk_9;

  extra-path = with pkgs; [
    dotnetCorePackages.sdk_9_0_3xx
  ];

  extra-lib = with pkgs; [
    # Personal development stuff
    xorg.libX11

    # Rider Unity debugging
    xorg.libXcursor
    xorg.libXrandr
    libglvnd
  ];

  _rider = pkgs.jetbrains.rider.overrideAttrs (attrs: {
    postInstall =
      ''
        # Wrap rider with extra tools and libraries
        mv $out/bin/rider $out/bin/.rider-toolless
        makeWrapper $out/bin/.rider-toolless $out/bin/rider \
          --argv0 rider \
          --prefix PATH : "${lib.makeBinPath extra-path}" \
          --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"

        # Making Unity Rider plugin work!
        # The plugin expects the binary to be at /rider/bin/rider, with bundled files at /rider/
        # It does this by going up one directory from the directory the binary is in
        # We have rider binary at $out/bin/rider, so we need to link /rider/ to $out/
        shopt -s extglob
        ln -s $out/rider/!(bin) $out/
        shopt -u extglob
      ''
      + attrs.postInstall or "";
  });
in {
  home.packages =
    [
      _rider
    ]
    ++ [_dotnet-sdk];

  # Unity Rider plugin looks here for a .desktop file,
  # which it uses to find the path to the rider binary.
  home.file = {
    ".local/share/applications/jetbrains-rider.desktop".source = let
      desktopFile = pkgs.makeDesktopItem {
        name = "jetbrains-rider";
        desktopName = "Rider";
        exec = "\"${_rider}/bin/rider\"";
        icon = "rider";
        type = "Application";
        # Don't show desktop icon in search or run launcher
        extraConfig.NoDisplay = "true";
      };
    in "${desktopFile}/share/applications/jetbrains-rider.desktop";
  };

  home.sessionVariables = {
    DOTNET_ROOT = "${_dotnet-sdk}/share/dotnet";
  };

  home.sessionPath = [
    "/home/${username}/.dotnet/tools"
  ];
}
