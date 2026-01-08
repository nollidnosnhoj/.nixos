{
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [./core.nix];

  stylix.image = "${self}/.assets/wallpapers/firewatch-purple.png";

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
      package = pkgs.nerd-fonts.comic-shanns-mono;
      name = "ComicShannsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.targets.qt.platform = lib.mkForce "qtct";
}
