{
  lib,
  pkgs,
  ...
}: {
  programs.waybar.settings.mainBar = {
    position = "top";
    modules-left = [
      "niri/workspaces"
      "tray"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "wireplumber"
      "group/net"
      "group/hardware"
      "battery"
      "power-profiles-daemon"
      "idle_inhibitor"
      "group/misc"
    ];
    clock = {
      format = "{:%a %d %b - %H:%M}";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      calendar = {
        mode = "month";
        mode-mon-col = 3;
        on-scroll = 1;
        on-click-right = "mode";
        format = {
          months = "<span color='#ffead3'><b>{}</b></span>";
          weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          today = "<span color='#ff6699'><b>{}</b></span>";
        };
      };
      actions = {
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
      };
    };
    backlight = {
      scroll-step = 10;
      tooltip = false;
      format = "{icon} {percent}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
    };
    battery = {
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{icon} {capacity}%";
      format-warning = "{icon} {capacity}%";
      format-critical = "{icon} {capacity}%";
      format-charging = " {capacity}%";
      format-plugged = " {capacity}%";
      format-alt = "{icon}  {time}";
      format-full = " {capacity}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
      ];
      tooltip-format = "{time}";
    };
    upower = {
      icon-size = 20;
      hide-if-empty = true;
      tooltip = true;
      tooltip-spacing = 20;
    };
    power-profiles-daemon = {
      format = "{icon} ";
      tooltip-format = "Power profile: {profile}\nDriver: {driver}";
      tooltip = true;
      format-icons = {
        default = "";
        performance = "";
        balanced = "";
        power-saver = "";
      };
    };
    "group/net" = {
      orientation = "inherit";
      modules = [
        "network"
        "bluetooth"
      ];
    };
    bluetooth = {
      # on-click = "${pkgs.blueman}/bin/blueman-manager";
      on-click = "${lib.getExe pkgs.kitty} --class bluetui -e bluetui";
      format = "󰂯";
      format-disabled = "󰂲";
      format-connected = "";
      format-connected-battery = " {device_battery_percentage}%";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
    };
    network = {
      format-wifi = " ";
      format-ethernet = "󰈀 ";
      format-linked = "{ifname} (No IP) ";
      format-disconnected = "󰤭 ";
      tooltip-format-wifi = "{essid}: {signalStrength}%";
      on-click = "${lib.getExe pkgs.kitty} --class impala -e impala";
    };
    wireplumber = {
      format = "{icon}  {volume}%";
      format-muted = "󰖁";
      on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
      format-icons = [
        ""
        ""
        ""
      ];
    };
    "niri/workspaces" = {
      all-outputs = false;
      current-only = true;
      format = "{index}";
      disable-click = true;
      disable-markup = true;
    };
    tray = {
      icon-size = 21;
      spacing = 10;
    };
    idle_inhibitor = {
      format = "{icon}";
      format-icons = {
        activated = " ";
        deactivated = " ";
      };
      tooltip-format-activated = "The computer is prevented from going to sleep";
      tooltip-format-deactivated = "The computer will go to sleep if the user is idle";
    };
    temperature = {
      format = "{temperatureC}°C ";
    };
    "custom/notification" = {
      tooltip-format = "Left: Notifications\nRight: Do not disturb";
      format = "{icon}";
      format-icons = {
        notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
        none = "";
        dnd-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
        dnd-none = "";
        inhibited-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
        inhibited-none = "";
        dnd-inhibited-notification = "<span rise='8pt'><span foreground='red'><sup></sup></span></span>";
        dnd-inhibited-none = "";
      };
      return-type = "json";
      exec-if = "which ${pkgs.swaynotificationcenter}/bin/swaync-client";
      exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
      on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
      on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
      escape = true;
    };
    "group/hardware" = {
      orientation = "inherit";
      drawer = {
        transition-duration = 300;
        transition-left-to-right = false;
      };
      modules = [
        "temperature"
        "disk"
        "cpu"
        "memory"
      ];
    };
    cpu = {
      format = " {usage}% ";
    };
    memory = {
      format = " {}% ";
    };
    disk = {
      interval = 30;
      format = "󱛟 {percentage_used}% ";
      path = "/";
    };
    "group/misc" = {
      orientation = "inherit";
      modules = [
        "custom/notification"
      ];
    };
  };
}
