{ ... }:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    GDK_BACKEND = "wayland";
    DIRENV_LOG_FORMAT = "";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_STYLE_OVERRIDE = "kvantum";
    MOZ_ENABLE_WAYLAND = 1;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "Nordic";
    GRIMBLAST_HIDE_CURSOR = 0;
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    XCURSOR_SIZE = 24;
    XCURSOR_THEME = "Bibata-Modern-Ice";
  };
}
