{pkgs, ...}: {
  # greetd display manager
  services.greetd = let
    session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --remember --asterisks --container-padding 2 --no-xsession-wrapper --cmd ${pkgs.niri}/bin/niri-session";
      user = "greeter";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
    };
  };

  security.pam.services.greetd = {
    enableGnomeKeyring = true;
    fprintAuth = false;
    gnupg.enable = false;
    kwallet.enable = false;
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
