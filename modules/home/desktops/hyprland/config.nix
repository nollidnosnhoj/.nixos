{pkgs, ...}: let
  mainMod = "SUPER";
  terminal = "kitty";
  browser = "firefox";
  menu = "walker";
  fileManager = "thunar";

  activeBorder1 = "rgb(81a1c1)";
  activeBorder2 = "rgb(8fbcbb)";
  activeBorderDeg = "45deg";
  inactiveBorder = "rgba(595959aa)";
  shadowColor = "rgba(1a1a1aee)";
in {
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        "dbus-update-activation-environment --systemd QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user start hyprpolkitagent"
        "swww-daemon"
        "swaync"
        "swayosd-server"
        "waybar"
        "walker --gapplication-service"
        "swww img $HOME/.nixos/.assets/wallpapers/nordtheme.png"
      ];

      input = {
        kb_layout = "us";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      general = {
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 1;
        border_size = 2;
        "col.active_border" = "${activeBorder1} ${activeBorder2} ${activeBorderDeg}";
        "col.inactive_border" = "${inactiveBorder}";
        resize_on_border = false;
        allow_tearing = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      decoration = {
        rounding = 0;
        active_opacity = 1;
        inactive_opacity = 1;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "${shadowColor}";
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      binds = {
        movefocus_cycles_fullscreen = true;
      };

      bind = [
        "${mainMod}, B, exec, ${browser}"
        "${mainMod}, RETURN, exec, ${terminal}"
        "${mainMod}, Q, killactive,"
        "${mainMod}, M, exit,"
        "${mainMod}, E, exec, ${fileManager}"
        "${mainMod}, F, togglefloating,"
        "${mainMod}, SPACE, exec, ${menu}"
        "${mainMod}, P, pseudo, # dwindle"
        "${mainMod}, J, togglesplit, # dwindle"
        "Alt_R, Control_R , exec, killall waybar || waybar"
        # bind = Alt_R, Control_R , exec, ironbar reload
        "Control_L&Alt_L, DELETE, exec, wlogout"

        # Move focus with mainMod + arrow keys
        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"
        "Alt_R, Tab, workspace, previous"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"

        ",XF86AudioMute, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle"

        # Clipboard
        # "${mainMod}, V, exec, ${terminal} --class clipse -e clipse"
      ];

      # mouse binding
      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume 5"
        ",XF86AudioLowerVolume, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume -5"
        ",XF86AudioMute, exec, ${pkgs.swayosd}/bin/swayosd-client --output-volume mute-toggle"
        ",XF86AudioMicMute, exec, ${pkgs.swayosd}/bin/swayosd-client --input-volume mute-toggle"
        ",XF86MonBrightnessUp, exec, ${pkgs.swayosd}/bin/swayosd-client --brightness raise"
        ",XF86MonBrightnessDown, exec, ${pkgs.swayosd}/bin/swayosd-client --brightness lower"
      ];

      bindl = [
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
        ", XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
      ];

      # windowrule
      windowrule = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "float, class:^(com.gabm.satty)$"
        "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
        "float,class:^(firefox)$,title:^(Extension)$"
        "float,class:^(firefox)$,title:^(Library)$"
        "float,class:^(.*)$,initialTitle:^(.*)(top)(.*)$"
        "float,class:^(.*)$,initialTitle:^(.*)(btop)(.*)$"
        "float,class:^(.*)$,initialTitle:^(.*)(htop)(.*)$"
        "float,class:^(kvantummanager)$"
        "float,class:^(qt5ct)$"
        "float,class:^(qt6ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(nwg-displays)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(\.blueman-manager-wrapped)$"
        "float,class:^(nm-applet)$"
        "float,size 622 652,stayfocused,class:^(clipse)$"
        "float,size 622 652,stayfocused,class:^(nmtui)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
        "float,class:^([Xx]dg-desktop-portal-gtk)$"
        "float,move 50% 50%,class:^(jetbrains-toolbox)"

        "workspace 1, class:^(firefox)$"
        "workspace 2, class:^(codium)$"
        "workspace 2, class:^(VSCodium)$"
        "workspace 2, class:^(kitty)$"
        "workspace 3, class:^(vesktop)$"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,auto

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
