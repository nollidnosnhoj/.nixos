{
  config,
  pkgs,
  ...
}: let
  font = config.stylix.fonts.serif.name;
in {
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      auth = {
        fingerprint = {
          enabled = true;
        };
      };

      label = [
        {
          monitor = "";
          #clock
          text = ''cmd[update:1000] echo "$TIME"'';
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 55;
          font_family = "${font}";
          position = "-100, 70";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
        {
          monitor = "";
          text = "$USER";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 20;
          font_family = "${font}";
          position = "-100, 160";
          halign = "right";
          valign = "bottom";
          shadow_passes = 5;
          shadow_size = 10;
        }
      ];
    };
  };
}
