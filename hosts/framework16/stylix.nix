{
  config,
  pkgs,
  ...
}: {
  stylix.enable = true;
  stylix.base16Scheme = config.custom.color-palette;
  stylix.image = config.custom.wallpaper;
  stylix.cursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  stylix.fonts = {
    serif = {
      package = pkgs.noto-fonts-cjk-serif;
      name = "Noto Serif";
    };

    sansSerif = {
      package = pkgs.noto-fonts-cjk-sans;
      name = "Noto Sans";
    };

    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.polarity = "dark";
}
