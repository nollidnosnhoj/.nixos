{pkgs, ...}: {
  home.packages = with pkgs; [
    wlogout
  ];

  programs.wlogout = {
    enable = true;
    package = pkgs.wlogout;
    layout = [
      {
        "label" = "lock";
        "action" = "hyprlock";
        "text" = "Lock";
        "keybind" = "l";
      }

      {
        "label" = "logout";
        "action" = "${pkgs.niri}/bin/niri msg action quit";
        "text" = "Logout";
        "keybind" = "e";
      }

      {
        "label" = "suspend";
        "action" = "systemctl suspend && hyprlock";
        "text" = "Suspend";
        "keybind" = "u";
      }

      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }

      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = " Shutdown ";
        "keybind" = "s";
      }

      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
    ];
  };
}
