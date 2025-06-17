{config, ...}: let
  font = config.stylix.fonts.monospace.name;
in {
  programs.waybar.style = ''
        * {
        font-family: "${font}";
        font-size: 16px;
        min-height: 0;
        font-weight: bold;
    }

    window#waybar {
        background: transparent;
        background-color: @base00;
        color: @base06;
        transition-property: background-color;
        transition-duration: 0.1s;
        border-bottom: 1px solid @base03;
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
        color: @base08;
    }

    #workspaces button.empty {
        color: @base04;
        opacity: 0.6;
    }

    #workspaces button.active {
        background-color: rgba(0, 0, 0, 0.3);
        color: @base0C;
        border-top: 2px solid @base0C;
    }

    #workspaces button.visible {
        opacity: 1;
    }

    #workspaces button.urgent {
        background-color: @base08;
    }

    #wireplumber,
    #idle_inhibitor,
    #power,
    #hardware,
    #misc,
    #net {
        color: @base07;
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
        color: @base07;
    }

    #bluetooth {
        opacity: 0.7;
    }

    #bluetooth.connected {
        opacity: 1;
    }

    #custom-wlogout {
        color: @base0B;
    }

    #idle_inhibitor {
        color: @base0B;
    }

    #idle_inhibitor.activated {
        color: @base08;
    }

    #battery {
        color: @base0E;
    }

    #temperature.critical {
        color: @base08;
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
