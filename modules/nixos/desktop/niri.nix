{pkgs, ...}: {
  imports = [
    ./nautilus.nix
    ./noctalia.nix
  ];

  environment.systemPackages = with pkgs; [
    xwayland-satellite-unstable
    wl-clipboard
    wl-clip-persist
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };

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
}
