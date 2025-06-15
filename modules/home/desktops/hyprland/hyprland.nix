{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    swww
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprpolkitagent.packages.${pkgs.system}.hyprpolkitagent
    grim
    slurp
    wl-clipboard
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    brightnessctl
    playerctl
    wireplumber
    poweralertd
    libnotify
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    xwayland.enable = true;
    package = null;
    portalPackage = null;
  };
}
