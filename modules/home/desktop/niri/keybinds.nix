{
  config,
  lib,
  pkgs,
  ...
}: let
  apps = import ./apps.nix {inherit pkgs;};
in {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    ModKey = "Mod";
  in
    {
      # App shortcuts
      "${ModKey}+Return".action = spawn apps.terminal;
      "${ModKey}+B".action = spawn apps.browser;
      "${ModKey}+Space".action = spawn apps.app-launcher;
      "${ModKey}+E".action = spawn apps.file-manager;
      "${ModKey}+Alt+L".action = spawn apps.lock-screen;
      "Ctrl+Alt+Delete".action = quit;

      "${ModKey}+Q".action = close-window;

      "${ModKey}+R".action = switch-preset-column-width;
      "${ModKey}+Shift+R".action = switch-preset-window-height;
      "${ModKey}+Ctrl+R".action = reset-window-height;
      "${ModKey}+F".action = maximize-column;
      "${ModKey}+Shift+F".action = fullscreen-window;
      "${ModKey}+Ctrl+F".action = expand-column-to-available-width;
      "${ModKey}+Ctrl+Shift+F".action = toggle-windowed-fullscreen;
      "${ModKey}+C".action = center-column;
      "${ModKey}+Ctrl+C".action = center-visible-columns;

      "${ModKey}+Minus".action = set-column-width "-10%";
      "${ModKey}+Equal".action = set-column-width "+10%";
      "${ModKey}+Ctrl+Minus".action = set-window-height "-10%";
      "${ModKey}+Ctrl+Equal".action = set-window-height "+10%";

      "${ModKey}+BracketLeft".action = consume-or-expel-window-left;
      "${ModKey}+BracketRight".action = consume-or-expel-window-right;

      "${ModKey}+Tab".action = focus-workspace-previous;
      "${ModKey}+H".action = focus-column-left;
      "${ModKey}+L".action = focus-column-right;
      "${ModKey}+J".action = focus-window-or-workspace-down;
      "${ModKey}+K".action = focus-window-or-workspace-up;

      "${ModKey}+Shift+H".action = move-column-left;
      "${ModKey}+Shift+L".action = move-column-right;
      "${ModKey}+Shift+K".action = move-column-to-workspace-up;
      "${ModKey}+Shift+J".action = move-column-to-workspace-down;

      "${ModKey}+WheelScrollDown" = {
        action = focus-column-right;
        cooldown-ms = 150;
      };

      "${ModKey}+WheelScrollUp" = {
        action = focus-column-left;
        cooldown-ms = 150;
      };

      # "${ModKey}+Shift+Ctrl+J".action = move-column-to-monitor-down;
      # "${ModKey}+Shift+Ctrl+K".action = move-column-to-monitor-up;

      # media playback
      "XF86AudioPlay".action = spawn "${pkgs.playerctl}/bin/playerctl" "play-pause";
      "XF86AudioStop".action = spawn "${pkgs.playerctl}/bin/playerctl" "pause";
      "XF86AudioPrev".action = spawn "${pkgs.playerctl}/bin/playerctl" "previous";
      "XF86AudioNext".action = spawn "${pkgs.playerctl}/bin/playerctl" "next";

      # volumes
      "XF86AudioRaiseVolume".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--output-volume" "raise";
      "XF86AudioLowerVolume".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--output-volume" "lower";
      "XF86AudioMute".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--output-volume" "mute-toggle";
      "XF86AudioMicMute".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--input-volume" "mute-toggle";

      # brightness
      "XF86MonBrightnessUp".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--brightness" "raise";
      "XF86MonBrightnessDown".action = spawn "${pkgs.swayosd}/bin/swayosd-client" "--brightness" "lower";

      # Screenshots
      "Ctrl+Print".action.screenshot-screen = {
        write-to-disk = true;
      };
      "${ModKey}+Print".action = screenshot-window;
      "Print".action.screenshot = {
        show-pointer = false;
      };
    }
    // lib.attrsets.listToAttrs (builtins.concatMap (i:
      with config.lib.niri.actions; [
        {
          name = "${ModKey}+${toString i}";
          value.action = focus-workspace i;
        }
        {
          name = "${ModKey}+Shift+${toString i}";
          value.action = spawn ["niri" "msg" "action" "move-column-to-workspace" (toString i)];
        }
      ]) (lib.range 1 9));
}
