{
  pkgs,
  username,
  ...
}: {
  # greetd display manager
  services = {
    greetd = let
      session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --asterisks --container-padding 2 --no-xsession-wrapper --cmd ${pkgs.niri}/bin/niri-session";
        user = "${username}";
      };
    in {
      enable = true;
      settings = {
        terminal.vt = 1;
        default_session = session;
        initial_session = session;
      };
    };
  };

  security.pam.services.greetd = {
    enableGnomeKeyring = true;
    fprintAuth = false;
    gnupg.enable = true;
    kwallet.enable = true;
  };

  systemd = {
    settings.Manager = {
      # To prevent getting stuck at shutdown
      DefaultTimeoutStopSec = "10s";
    };
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
