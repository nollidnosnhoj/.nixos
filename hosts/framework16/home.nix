{...}: {
  imports = [
    ../common/home-desktop-base.nix
  ];

  services.easyeffects = {
    enable = true;
    preset = "easyeffect_fw16";
  };

  # programs.keychain = {
  #   enable = true;
  #   enableFishIntegration = true;
  #   keys = ["id_ed25519"];
  # };
}
