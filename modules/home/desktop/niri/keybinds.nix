{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    open-browser = spawn "${pkgs.firefox}/bin/firefox";
    open-file-manager = spawn "${pkgs.nautilus}/bin/nautilus";
    open-terminal = spawn "${pkgs.foot}/bin/foot";
    open-app-menu = spawn "${pkgs.fuzzel}/bin/fuzzel";

    set-volume = spawn "${pkgs.swayosd}/bin/swayosd-client" "--output-volume";
    set-brightness = spawn "${pkgs.swayosd}/bin/swayosd-client" "--brightness";
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    "XF86AudioMute".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--output-volume" "mute-toggle";
    "XF86AudioMicMute".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--input-volume" "mute-toggle";

    "XF86AudioPlay".action = playerctl "play-pause";
    "XF86AudioStop".action = playerctl "pause";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioNext".action = playerctl "next";

    "XF86AudioRaiseVolume".action = set-volume "raise";
    "XF86AudioLowerVolume".action = set-volume "lower";

    "XF86MonBrightnessUp".action = set-brightness "raise";
    "XF86MonBrightnessDown".action = set-brightness "lower";

    "Print".action.screenshot-screen = {
      write-to-disk = true;
    };
    "Mod+Shift+Alt+S".action = screenshot-window;
    "Mod+Shift+S".action.screenshot = {
      show-pointer = false;
    };
    "Mod+Return".action = open-terminal;
    "Mod+B".action = open-browser;
    "Mod+Space".action = open-app-menu;
    "Mod+E".action = open-file-manager;
    "Ctrl+Alt+Delete".action = quit;
    "Mod+Alt+L".action = spawn "hyprlock";

    "Mod+Q".action = close-window;
    "Mod+S".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = expand-column-to-available-width;
    "Mod+V".action = toggle-window-floating;
    "Mod+W".action = toggle-column-tabbed-display;

    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;
    "Mod+C".action = center-visible-columns;
    "Mod+Tab".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Plus".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Plus".action = set-window-height "+10%";

    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;

    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+J".action = move-column-to-workspace-down;

    "Mod+WheelScrollDown" = {
      action = focus-column-right;
      cooldown-ms = 150;
    };

    "Mod+WheelScrollUp" = {
      action = focus-column-left;
      cooldown-ms = 150;
    };

    "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
  };
}
