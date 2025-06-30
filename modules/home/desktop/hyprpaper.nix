{
  config,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      ipc = "off";
      preload = ["${config.stylix.image}"];
      wallpaper = [",${config.stylix.image}"];
    };
  };
}
