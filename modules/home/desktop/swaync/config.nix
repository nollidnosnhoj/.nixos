{
  lib,
  pkgs,
  ...
}: {
  services.swaync.settings = {
    positionX = "right";
    positionY = "top";
    control-center-margin-top = 10;
    control-center-margin-bottom = 10;
    control-center-margin-right = 10;
    notification-icon-size = 64;
    notification-body-image-height = 100;
    notification-body-image-width = 200;
    timeout = 10;
    timeout-low = 5;
    timeout-critical = 0;
    fit-to-screen = false;
    control-center-width = 500;
    control-center-height = 1033;
    notification-window-width = 500;
    keyboard-shortcuts = true;
    image-visibility = "when-available";
    transition-time = 200;
    hide-on-clear = false;
    hide-on-action = true;
    script-fail-notify = true;
    widgets = [
      "inhibitors"
      "title"
      "dnd"
      "buttons-grid"
      "volume"
      "backlight"
      "mpris"
    ];
    widget-config = {
      title = {
        text = "Notification Center";
        clear-all-button = true;
        button-text = "󰆴 Clear";
      };
      dnd = {
        text = "Do Not Disturb";
      };
      label = {
        max-lines = 1;
        text = "Notification Center";
      };
      mpris = {
        image-size = 100;
        image-radius = 0;
        blacklist = [
          "kew"
          "firefox"
        ];
      };
      volume = {
        label = "󰕾";
      };
      backlight = {
        label = "󰃟";
      };
      buttons-grid = {
        actions = [
          {
            label = "󰐥";
            command = "systemctl poweroff";
          }
          {
            label = "󰜉";
            command = "systemctl reboot";
          }
          {
            label = "󰌾";
            command = "hyprlock";
          }
          {
            label = "󰕾";
            command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            type = "toggle";
          }
          {
            label = "󰍬";
            command = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            type = "toggle";
          }
          {
            label = "󰖩";
            command = "${lib.getExe pkgs.foot} -a nmtui -e nmtui";
          }
          {
            label = "󰂯";
            command = "${pkgs.blueman}/bin/blueman-manager";
          }
        ];
      };
    };
  };
}
