{
  inputs,
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite-unstable
    grim
    pamixer
    playerctl
    slurp
    wl-clipboard
    wl-clip-persist
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  xdg.portal = {
    enable = true;
    config = {
      #common.default = "*";
      common = {
        default = ["gnome" "gtk"];
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
      };
    };
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  home-manager.users.${username} = {...}: {
    imports = [
      inputs.niri.homeModules.config
      inputs.niri.homeModules.stylix
      ./environments.nix
      ./keybinds.nix
      ./rules.nix
      ./settings.nix
    ];
  };
}
