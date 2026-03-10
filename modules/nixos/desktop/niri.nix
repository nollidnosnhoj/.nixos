{inputs,pkgs,...}: let
  noctalia-shell = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    calendarSupport = true;
  };
in {

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services.gnome.evolution-data-server.enable = true;

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
    nautilus
    sushi
    file-roller

    noctalia-shell
  ];

  # greetd login manager

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

  # stylix

  stylix.cursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  stylix.fonts = {
    serif = {
      package = pkgs.noto-fonts-cjk-serif;
      name = "Noto Serif";
    };

    sansSerif = {
      package = pkgs.noto-fonts-cjk-sans;
      name = "Noto Sans";
    };

    monospace = {
      package = pkgs.nerd-fonts.comic-shanns-mono;
      name = "ComicShannsMono Nerd Font";
    };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };

  stylix.targets.qt.platform = lib.mkForce "qtct";
}