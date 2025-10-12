{
  self,
  lib,
  pkgs,
  username,
  ...
}: {
  stylix.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
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
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.polarity = "dark";

  stylix.targets.plymouth = {
    enable = true;
    logo = "${self}/.assets/NixOS.png";
    logoAnimated = true;
  };

  stylix.targets.qt.platform = lib.mkForce "qtct";

  home-manager.users.${username} = {
    stylix = {
      targets = {
        firefox.profileNames = ["kopa"];
        zen-browser.profileNames = ["default"];
      };
      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        light = "Papirus";
      };
    };
  };
}
