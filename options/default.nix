{
  lib,
  pkgs,
  self,
  ...
}:
with lib; {
  options = {
    is-laptop = mkOption {
      type = types.bool;
      default = false;
      description = "Determine if this configuration is for a laptop.";
    };
    desktop = {
      wallpaper = mkOption {
        type = types.path;
        default = "${self}/.assets/wallpapers/nordtheme.png";
        description = "Set a wallpaper for your environment.";
      };
      palette = mkOption {
        type = with types; nullOr (oneOf [path attrs lines]);
        default = "${pkgs.base16-schemes}/share/themes/nord.yaml";
        description = "Color palette for desktop. Leave null if you want it to be generated based on wallpaper.";
      };
    };
    input = {
      mouse-sensivity = mkOption {
        type = types.float;
        default = 0.0;
        example = -0.6;
      };
    };
  };
}
