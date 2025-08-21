{pkgs, ...}: let
  lockScreen = "qs ipc call lockScreen toggle";
in {
  services.hypridle = {
    enable = true;
    package = pkgs.hypridle;

    settings = {
      general = {
        lock_cmd = lockScreen;
        before_sleep_cmd = "loginctl lock-session"; # lock before suspend.
        after_sleep_cmd = "${pkgs.niri}/bin/niri msg action power-on-monitors"; # to avoid having to press a key twice to turn on the display.
      };

      listener = [
        # Screenlock
        {
          timeout = 600;
          # HYPRLOCK ONTIMEOUT
          on-timeout = "loginctl lock-session";
        }
        # DPMS
        {
          # DPMS TIMEOUT
          timeout = 660;
          # DPMS ONTIMEOUT
          on-timeout = "${pkgs.niri}/bin/niri msg action power-off-monitors";
          # DPMS ONRESUME
          on-resume = "${pkgs.niri}/bin/niri msg action power-on-monitors";
        }
        # Suspend
        {
          # SUSPEND TIMEOUT
          timeout = 1800;
          #SUSPEND ONTIMEOUT
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
