{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ../common/swaync
    ../common/gtk.nix
    ./hypridle.nix # idle
    ../common/hyprlock.nix # lock screen
    ../common/hyprpaper.nix # wallpaper
    ../common/fuzzel.nix
    ../common/waybar
    ../common/wlogout.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    slurp
    wl-clipboard
    wl-clip-persist
    glib
    wayland
    direnv
    brightnessctl
    playerctl
    wireplumber
    poweralertd
    libnotify
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      spawn-at-startup = [
        {command = ["xwayland-satellite"];}
        {command = ["swaync"];}
        {command = ["waybar"];}
        {
          command = ["${pkgs.fuzzel}/bin/fuzzel"];
        }
      ];
      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        DISPLAY = ":0";
      };
      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };
        mouse = {
          scroll-factor = 1.5;
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;
      };
      screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
      outputs = {
        "eDP-1" = {
          mode = {
            width = 2560;
            height = 1600;
            refresh = null;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
        "HDMI-A-1" = {
          mode = {
            width = 2560;
            height = 1440;
            refresh = null;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      overview = {
        # workspace-shadow = "off";
        backdrop-color = "transparent";
      };
      gestures = {
        hot-corners.enable = true;
      };
      layout = {
        border.enable = true;
        border.width = 1;
        shadow = {
          enable = true;
        };
        preset-column-widths = [
          {proportion = 0.25;}
          {proportion = 0.5;}
          {proportion = 0.75;}
          {proportion = 1.0;}
        ];
        default-column-width = {
          proportion = 0.5;
        };

        gaps = 6;
        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };

        tab-indicator = {
          hide-when-single-tab = true;
          place-within-column = true;
          position = "left";
          corner-radius = 20.0;
          gap = -12.0;
          gaps-between-tabs = 10.0;
          width = 4.0;
          length.total-proportion = 0.1;
        };
      };

      binds = with config.lib.niri.actions; let
        open-browser = spawn "${pkgs.firefox}/bin/firefox";
        open-file-manager = spawn "thunar";
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
        "Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
        "Mod+B".action = open-browser;
        "Mod+Space".action = spawn "${pkgs.fuzzel}/bin/fuzzel";
        "Mod+E".action = open-file-manager;
        # "Ctrl+Alt+L".action = spawn "sh -c pgrep hyprlock || hyprlock";

        # "Mod+U".action = spawn "env XDG_CURRENT_DESKTOP=gnome gnome-control-center";

        "Mod+Q".action = close-window;
        "Mod+S".action = switch-preset-column-width;
        "Mod+F".action = maximize-column;
        # "Mod+Shift+F".action = fullscreen-window;
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

        "Ctrl+Alt+Delete".action = spawn "${pkgs.wlogout}/bin/wlogout";
      };

      window-rules = [
        {
          geometry-corner-radius = let
            radius = 16.0;
          in {
            bottom-left = radius;
            bottom-right = radius;
            top-left = radius;
            top-right = radius;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [
            {is-floating = true;}
          ];
          shadow.enable = true;
        }
        {
          matches = [
            {
              is-window-cast-target = true;
            }
          ];
          focus-ring = {
            active.color = "#f38ba8";
            inactive.color = "#7d0d2d";
          };
          border = {
            inactive.color = "#7d0d2d";
          };
          shadow = {
            color = "#7d0d2d70";
          };
          tab-indicator = {
            active.color = "#f38ba8";
            inactive.color = "#7d0d2d";
          };
        }
        {
          matches = [{app-id = "org.telegram.desktop";}];
          block-out-from = "screencast";
        }
        {
          matches = [{app-id = "app.drey.PaperPlane";}];
          block-out-from = "screencast";
        }
        {
          matches = [
            {app-id = "zen";}
            {app-id = "firefox";}
            {app-id = "chromium-browser";}
            {app-id = "xdg-desktop-portal-gtk";}
          ];
          scroll-factor = 0.2;
        }
        {
          matches = [
            {app-id = "zen";}
            {app-id = "firefox";}
            {app-id = "chromium-browser";}
            {app-id = "edge";}
          ];
          open-maximized = true;
        }
        {
          matches = [
            {
              app-id = "firefox";
              title = "Picture-in-Picture";
            }
          ];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
          default-column-width = {
            fixed = 480;
          };
          default-window-height = {
            fixed = 270;
          };
        }
        {
          matches = [
            {
              app-id = "zen";
              title = "Picture-in-Picture";
            }
          ];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
          default-column-width = {
            fixed = 480;
          };
          default-window-height = {
            fixed = 270;
          };
        }
        {
          matches = [{title = "Picture in picture";}];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
        }
        {
          matches = [{title = "Discord Popout";}];
          open-floating = true;
          default-floating-position = {
            x = 32;
            y = 32;
            relative-to = "bottom-right";
          };
        }
        {
          matches = [{app-id = "pavucontrol";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "pavucontrol-qt";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "com.saivert.pwvucontrol";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "io.github.fsobolev.Cavalier";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "dialog";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "popup";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "task_dialog";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "gcr-prompter";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "file-roller";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "org.gnome.FileRoller";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "nm-connection-editor";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "blueman-manager";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "iwgtk";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "xdg-desktop-portal-gtk";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "org.gnome.polkit-gnome-authentication-agent-1";}];
          open-floating = true;
        }
        {
          matches = [{app-id = "pinentry";}];
          open-floating = true;
        }
        {
          matches = [{title = "Progress";}];
          open-floating = true;
        }
        {
          matches = [{title = "File Operations";}];
          open-floating = true;
        }
        {
          matches = [{title = "Copying";}];
          open-floating = true;
        }
        {
          matches = [{title = "Moving";}];
          open-floating = true;
        }
        {
          matches = [{title = "Properties";}];
          open-floating = true;
        }
        {
          matches = [{title = "Downloads";}];
          open-floating = true;
        }
        {
          matches = [{title = "file progress";}];
          open-floating = true;
        }
        {
          matches = [{title = "Confirm";}];
          open-floating = true;
        }
        {
          matches = [{title = "Authentication Required";}];
          open-floating = true;
        }
        {
          matches = [{title = "Notice";}];
          open-floating = true;
        }
        {
          matches = [{title = "Warning";}];
          open-floating = true;
        }
        {
          matches = [{title = "Error";}];
          open-floating = true;
        }
      ];
      layer-rules = [
        {
          matches = [{namespace = "^swww$";}];
          # place-within-backdrop = true;
        }
      ];

      animations.shaders.window-resize = ''
        vec4 resize_color(vec3 coords_curr_geo, vec3 size_curr_geo) {
          vec3 coords_next_geo = niri_curr_geo_to_next_geo * coords_curr_geo;

          vec3 coords_stretch = niri_geo_to_tex_next * coords_curr_geo;
          vec3 coords_crop = niri_geo_to_tex_next * coords_next_geo;

          // We can crop if the current window size is smaller than the next window
          // size. One way to tell is by comparing to 1.0 the X and Y scaling
          // coefficients in the current-to-next transformation matrix.
          bool can_crop_by_x = niri_curr_geo_to_next_geo[0][0] <= 1.0;
          bool can_crop_by_y = niri_curr_geo_to_next_geo[1][1] <= 1.0;

          vec3 coords = coords_stretch;
          if (can_crop_by_x)
              coords.x = coords_crop.x;
          if (can_crop_by_y)
              coords.y = coords_crop.y;

          vec4 color = texture2D(niri_tex_next, coords.st);

          // However, when we crop, we also want to crop out anything outside the
          // current geometry. This is because the area of the shader is unspecified
          // and usually bigger than the current geometry, so if we don't fill pixels
          // outside with transparency, the texture will leak out.
          //
          // When stretching, this is not an issue because the area outside will
          // correspond to client-side decoration shadows, which are already supposed
          // to be outside.
          if (can_crop_by_x && (coords_curr_geo.x < 0.0 || 1.0 < coords_curr_geo.x))
              color = vec4(0.0);
          if (can_crop_by_y && (coords_curr_geo.y < 0.0 || 1.0 < coords_curr_geo.y))
              color = vec4(0.0);

          return color;
        }
      '';
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
    };
  };
}
