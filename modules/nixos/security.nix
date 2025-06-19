{pkgs, ...}: {
  security.rtkit.enable = true;
  security.sudo.enable = true;
  # security.pam.services.swaylock = {};
  security.pam.services.hyprlock = {};

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  security.polkit.enable = true;
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = ["graphical-session.target"];
    wants = ["graphical-session.target"];
    after = ["graphical-session.target"];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
