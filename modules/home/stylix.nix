{pkgs, ...}: {
  stylix = {
    targets = {
      zen-browser.profileNames = ["default"];
    };
    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus";
    };
  };
}
