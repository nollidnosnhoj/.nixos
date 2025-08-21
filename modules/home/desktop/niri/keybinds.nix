{
  config,
  lib,
  pkgs,
  ...
}: let
  apps = import ./apps.nix {inherit pkgs;};
in {
  programs.niri.settings.binds = with config.lib.niri.actions;
    {
      "Mod+Shift+Slash".action = show-hotkey-overlay;

      # App shortcuts
      "Mod+Return".action = spawn apps.terminal;
      "Mod+B".action = spawn apps.browser;
      "Mod+Space".action = spawn ["qs" "ipc" "call" "appLauncher" "toggle"];
      "Mod+E".action = spawn apps.file-manager;
      "Mod+Alt+L".action = spawn ["qs" "ipc" "call" "lockScreen" "toggle"];
      "Ctrl+Alt+Delete".action = quit;

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

      "Mod+Tab".action = focus-workspace-previous;
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

      # media playback
      "XF86AudioPlay" = {
        action = spawn "${pkgs.playerctl}/bin/playerctl" "play-pause";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86AudioStop" = {
        action = spawn "${pkgs.playerctl}/bin/playerctl" "pause";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86AudioPrev" = {
        action = spawn "${pkgs.playerctl}/bin/playerctl" "previous";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86AudioNext" = {
        action = spawn "${pkgs.playerctl}/bin/playerctl" "next";
        allow-when-locked = true;
        repeat = false;
      };

      # volumes
      "XF86AudioRaiseVolume" = {
        action = spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86AudioLowerVolume" = {
        action = spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86AudioMute" = {
        action = spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86AudioMicMute" = {
        action = spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
        allow-when-locked = true;
        repeat = false;
      };

      # brightness
      "XF86MonBrightnessUp" = {
        action = spawn "${pkgs.light}/bin/light" "-A" "5";
        allow-when-locked = true;
        repeat = false;
      };
      "XF86MonBrightnessDown" = {
        action = spawn "${pkgs.light}/bin/light" "-U" "5";
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
      "Alt+Print".action = screenshot-window;
    }
    // lib.attrsets.listToAttrs (builtins.concatMap (i:
      with config.lib.niri.actions; [
        {
          name = "Mod+${toString i}";
          value.action = focus-workspace i;
        }
        {
          name = "Mod+Shift+${toString i}";
          value.action = spawn ["niri" "msg" "action" "move-column-to-workspace" (toString i)];
        }
      ]) (lib.range 1 9));
}
