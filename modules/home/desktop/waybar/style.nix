{config, ...}: let
  font = config.stylix.fonts.sansSerif.name;
  colors = config.lib.stylix.colors.withHashtag;
in {
  stylix.targets.waybar.enable = false;
  programs.waybar.style = with colors; ''
    @define-color base00 ${base00};
    @define-color base01 ${base01};
    @define-color base02 ${base02};
    @define-color base03 ${base03};
    @define-color base04 ${base04};
    @define-color base05 ${base05};
    @define-color base06 ${base06};
    @define-color base07 ${base07};

    @define-color base08 ${base08};
    @define-color base09 ${base09};
    @define-color base0A ${base0A};
    @define-color base0B ${base0B};
    @define-color base0C ${base0C};
    @define-color base0D ${base0D};
    @define-color base0E ${base0E};
    @define-color base0F ${base0F};

    * {
      font-family: "${font}";
      font-size: 20px;
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

    window#waybar.empty #window {
      background-color: transparent;
    }

    button {
      box-shadow: inset 0 -3px transparent;
      border: none;
      border-radius: 0;
    }

    #workspaces {
      padding-right: 4px;
    }

    #workspaces button {
      padding: 0 4px;
      color: @base0C;
      opacity: 0.6;
    }

    #workspaces button.empty {
      color: @base04;
      opacity: 0.6;
    }

    #workspaces button.active, #workspaces button.focused {
      background-color: rgba(0, 0, 0, 0.3);
      color: @base0C;
      opacity: 1;
      border-top: 2px solid @base0C;
    }

    #battery,
    #idle_inhibitor,
    #pulseaudio,
    #wireplumber,
    #network,
    #bluetooth,
    #mode,
    #power-profiles-daemon,
    #custom-notification,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #power {
      padding-left: 10px;
      padding-right: 10px;
      color: @base07;
    }

    #tray {
      padding-left: 4px;
      padding-right: 4px;
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
      margin-right: 4px;
    }
  '';
}
