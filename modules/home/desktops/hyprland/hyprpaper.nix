{
  config,
  inputs,
  pkgs,
  ...
}: {
  services.hyprpaper = {
    enable = true;
    package = inputs.hyprpaper.packages.${pkgs.system}.default;
    settings = {
      ipc = "off";
      preload = ["${config.stylix.image}"];
      wallpaper = [",${config.stylix.image}"];
    };
  };
}
