{...}: {
  programs.niri.settings.environment = {
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    SDL_VIDEODRIVER = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    QT_QPA_PLATFORMTHEME = "gtk3";
    # DISPLAY = ":0";
  };
}
