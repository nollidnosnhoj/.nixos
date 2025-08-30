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
    # pinentryFlavor = "";
  };
  services.pcscd.enable = true;
  programs.nix-ld.enable = true;

  programs.ssh = {
    enableAskPassword = true;
  };
}
