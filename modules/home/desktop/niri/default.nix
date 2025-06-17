{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./autostart.nix
    ./environments.nix
    ./keybinds.nix
    ./rules.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
  ];

  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme.override {color = "black";};
    };
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
