{...}: {
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.swaylock = {};
  security.pam.services.hyprlock = {};

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
}
