{
  lib,
  pkgs,
  ...
}: {
  programs.niri.settings = {
    spawn-at-startup = [
      {
        command = [
          "noctalia-shell"
        ];
      }
    ];
    xwayland-satellite = {
      enable = true;
      path = "${lib.getExe pkgs.xwayland-satellite-unstable}";
    };
    input = {
      keyboard.xkb.layout = "us";
      keyboard.numlock = true;
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
        accel-profile = "flat";
        scroll-factor = 1.5;
      };
      focus-follows-mouse.enable = true;
      warp-mouse-to-focus.enable = true;
      workspace-auto-back-and-forth = true;
    };
    screenshot-path = "~/Pictures/Screenshots/Screenshot-from-%Y-%m-%d-%H-%M-%S.png";
    outputs = {
      "LG Electronics LG ULTRAGEAR 104NTRL5T534" = {
        focus-at-startup = true;
        mode = {
          width = 2560;
          height = 1440;
          refresh = 143.933;
        };
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };
      "eDP-1" = {
        mode = {
          width = 2560;
          height = 1600;
          refresh = 165.000;
        };
        scale = 1.5;
        position = {
          x = 0;
          y = 0;
        };
      };
    };

    overview = {
      workspace-shadow.enable = true;
      backdrop-color = "transparent";
    };
    gestures = {
      hot-corners.enable = true;
    };
    layout = {
      background-color = "transparent";
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
    animations.enable = true;
    prefer-no-csd = true;
    hotkey-overlay.skip-at-startup = true;
  };
}
