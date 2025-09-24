{pkgs, ...}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  services.udev.packages = with pkgs; [
    qmk-udev-rules
    yubikey-personalization
  ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };
  services.pcscd.enable = true;

  programs.ssh = {
    enableAskPassword = true;
  };
}
