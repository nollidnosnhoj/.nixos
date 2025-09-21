{config, ...}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  programs.niri.settings = {
    window-rules = with colors; [
      {
        geometry-corner-radius = let
          radius = 20.0;
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
        tab-indicator = {
          active.color = base0D;
          inactive.color = base03;
        };
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
        matches = [{app-id = "com.chatterino.";}];
        default-column-width.proportion = 0.2;
      }
      {
        matches = [
          {app-id = "pavucontrol";}
          {app-id = "pavucontrol-qt";}
          {app-id = "com.saivert.pwvucontrol";}
          {app-id = "dialog";}
          {app-id = "popup";}
          {app-id = "task_dialog";}
          {app-id = "gcr-prompter";}
          {app-id = "file-roller";}
          {app-id = "org.gnome.FileRoller";}
          {app-id = "nm-connection-editor";}
          {app-id = "nmtui";}
          {app-id = "blueman-manager";}
          {app-id = "xdg-desktop-portal-gtk";}
          {app-id = "org.gnome.polkit-gnome-authentication-agent-1";}
          {app-id = "pinentry";}
          {title = "Progress";}
          {title = "File Operations";}
          {title = "Copying";}
          {title = "Moving";}
          {title = "Properties";}
          {title = "Downloads";}
          {title = "file progress";}
          {title = "Confirm";}
          {title = "Authentication Required";}
          {title = "Notice";}
          {title = "Warning";}
          {title = "Error";}
          {title = "Extension:";}
          {
            title = "Welcome to JetBrains Rider";
            app-id = "jetbrains-rider";
          }
        ];
        open-floating = true;
      }
      {
        matches = [{app-id = "vesktop";}];
        open-maximized = true;
        open-on-output = "eDP-1";
      }
      {
        matches = [{app-id = "jetbrains-rider";}];
        open-maximized = true;
      }
    ];
    layer-rules = [
      {
        matches = [{namespace = "^swww-daemon$";}];
        place-within-backdrop = true;
      }
      {
        matches = [{namespace = "^quickshell-wallpaper$";}];
      }
      {
        matches = [{namespace = "^quickshell-overview$";}];
        place-within-backdrop = true;
      }
    ];
  };
}
