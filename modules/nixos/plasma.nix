{ username, pkgs, ... }: {
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  users.users.${username}.packages = with pkgs; [
    kdePackages.kate
  ];
}
