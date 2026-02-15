{
  config,
  pkgs,
  ...
}: let
  apps = import ./apps.nix {inherit pkgs;};

  noctalia = cmd:
    [
      "noctalia-shell"
      "ipc"
      "call"
    ]
    ++ (pkgs.lib.splitString " " cmd);
in {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Shift+Slash".action = show-hotkey-overlay;

    # App shortcuts
    "Mod+Return".action.spawn = apps.terminal;
    "Mod+B".action.spawn = apps.browser;
    "Mod+E".action.spawn = apps.fileManager;

    "Mod+Space".action.spawn = noctalia "launcher toggle";
    "Mod+Alt+L".action.spawn = noctalia "lockScreen toggle";
    "Mod+P".action.spawn = noctalia "sessionMenu toggle";
    # "Mod+S".action.spawn = noctalia "controlCenter toggle";
    "Mod+S".action.spawn = "quick-search";

    "Mod+Q".action = close-window;

    "Mod+R".action = switch-preset-column-width;
    "Mod+Shift+R".action = switch-preset-window-height;
    "Mod+Ctrl+R".action = reset-window-height;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Ctrl+F".action = expand-column-to-available-width;
    "Mod+Ctrl+Shift+F".action = toggle-windowed-fullscreen;
    "Mod+C".action = center-column;
    "Mod+Ctrl+C".action = center-visible-columns;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Equal".action = set-column-width "+10%";
    "Mod+Ctrl+Minus".action = set-window-height "-10%";
    "Mod+Ctrl+Equal".action = set-window-height "+10%";

    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;

    "Mod+H".action = focus-column-left;
    "Mod+L".action = focus-column-right;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;

    "Mod+Shift+H".action = move-column-left;
    "Mod+Shift+L".action = move-column-right;
    "Mod+Shift+K".action = move-column-to-workspace-up;
    "Mod+Shift+J".action = move-column-to-workspace-down;

    "Mod+Ctrl+Tab".action = focus-monitor-previous;
    "Mod+Ctrl+H".action = focus-monitor-left;
    "Mod+Ctrl+L".action = focus-monitor-right;

    "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

    "Mod+WheelScrollDown" = {
      action = focus-column-right;
      cooldown-ms = 150;
    };

    "Mod+WheelScrollUp" = {
      action = focus-column-left;
      cooldown-ms = 150;
    };

    # "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
    # "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;

    "Mod+Tab".action = focus-workspace-previous;
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;
    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Shift+6".action.move-column-to-workspace = 6;
    "Mod+Shift+7".action.move-column-to-workspace = 7;
    "Mod+Shift+8".action.move-column-to-workspace = 8;
    "Mod+Shift+9".action.move-column-to-workspace = 9;

    # media playback
    "XF86AudioPlay" = {
      action.spawn = ["playerctl" "play-pause"];
      allow-when-locked = true;
      repeat = false;
    };
    "XF86AudioStop" = {
      action.spawn = ["playerctl" "pause"];
      allow-when-locked = true;
      repeat = false;
    };
    "XF86AudioPrev" = {
      action.spawn = ["playerctl" "previous"];
      allow-when-locked = true;
      repeat = false;
    };
    "XF86AudioNext" = {
      action.spawn = ["playerctl" "next"];
      allow-when-locked = true;
      repeat = false;
    };

    # volumes
    "XF86AudioRaiseVolume" = {
      action.spawn = noctalia "volume increase";
      allow-when-locked = true;
      repeat = false;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = noctalia "volume decrease";
      allow-when-locked = true;
      repeat = false;
    };
    "XF86AudioMute" = {
      action.spawn = noctalia "volume muteOutput";
      allow-when-locked = true;
      repeat = false;
    };
    "XF86AudioMicMute" = {
      action.spawn = noctalia "volume muteInput";
      allow-when-locked = true;
      repeat = false;
    };

    # brightness
    "XF86MonBrightnessUp" = {
      action.spawn = noctalia "brightness increase";
      allow-when-locked = true;
      repeat = false;
    };
    "XF86MonBrightnessDown" = {
      action.spawn = noctalia "brightness decrease";
      allow-when-locked = true;
      repeat = false;
    };

    # Screenshots
    "Print".action.screenshot = {
      show-pointer = false;
    };
    "Ctrl+Print".action.screenshot-screen = {
      write-to-disk = true;
    };
    "Alt+Print".action.screenshot-window = [];
  };
}
