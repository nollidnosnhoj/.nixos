{ ... }:
let
  nord = {
    nord0 = "#2e3440";
    nord1 = "#3b4252";
    nord2 = "#434c5e";
    nord3 = "#4c566a";
    nord4 = "#d8dee9";
    nord5 = "#e5e9f0";
    nord6 = "#eceff4";
    nord7 = "#8fbcbb";
    nord8 = "#88c0d0";
    nord9 = "#81a1c1";

    nord10 = "#5e81ac";
    nord11 = "#bf616a";
    nord12 = "#d08770";
    nord13 = "#ebcb8b";
    nord14 = "#a3be8c";
    nord15 = "#b48ead";
  };
in
{
  programs.waybar.style = with nord; ''
        * {
        font-family: "Noto Sans Nerd Font";
        font-size: 16px;
        min-height: 0;
        font-weight: bold;
    }

    window#waybar {
        background: transparent;
        background-color: ${nord0};
        color: ${nord6};
        transition-property: background-color;
        transition-duration: 0.1s;
        border-bottom: 1px solid ${nord3};
    }

    button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
    }

    button:hover {
        background: inherit;
    }

    #workspaces button {
        padding: 0 4px;
        color: ${nord8};
    }

    #workspaces button.empty {
        color: ${nord4};
        opacity: 0.6;
    }

    #workspaces button.active {
        background-color: rgba(0, 0, 0, 0.3);
        color: ${nord8};
        border-top: 2px solid ${nord8};
    }

    #workspaces button.visible {
        opacity: 1;
    }

    #workspaces button.urgent {
        background-color: ${nord11};
    }

    #wireplumber,
    #idle_inhibitor,
    #power,
    #hardware,
    #misc,
    #net {
        color: ${nord7};
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 4px;
        padding-right: 4px;
        margin-right: 2px;
        margin-left: 2px;
        margin-top: 4px;
        margin-bottom: 4px;
    }

    #battery,
    #pulseaudio,
    #wireplumber,
    #network,
    #bluetooth,
    #tray,
    #mode,
    #scratchpad,
    #power-profiles-daemon,
    #custom-notification,
    #custom-pacman,
    #custom-wlogout,
    #cpu, 
    #memory, 
    #disk, 
    #temperature  {
        padding-left: 6px;
        padding-right: 6px;
        color: ${nord7};
    }

    #bluetooth {
        opacity: 0.7;
    }

    #bluetooth.connected {
        opacity: 1;
    }

    #custom-wlogout {
        color: ${nord11};
    }

    #custom-pacman.pending-updates {
        color: ${nord13};
    }

    #custom-pacman.updated {
        color: ${nord14};
    }

    #idle_inhibitor {
        color: ${nord14};
    }

    #idle_inhibitor.activated {
        color: ${nord11};
    }

    #battery {
        color: ${nord14};
    }

    #temperature.critical {
        color: ${nord11};
    }


    /* If workspaces is the leftmost module, omit left margin */
    .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
    }

    .modules-center {
        margin: 4px;
        padding-left: 8;
        padding-right: 8;
    }

    /* If workspaces is the rightmost module, omit right margin */
    .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
    }

    .modules-right {
        margin-right: 2px;
    }
  '';
}
