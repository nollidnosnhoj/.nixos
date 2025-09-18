{
  inputs,
  pkgs,
  ...
}: {
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

  environment.systemPackages = with pkgs; [
    pamixer
    playerctl
    slurp
    wl-clipboard
    wl-clip-persist
    pavucontrol
    blueman
  ];
}
