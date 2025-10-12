{...}: {
  imports = [
    ../../modules/home
  ];
  services = {
    easyeffects = {
      enable = true;
      preset = "easyeffect_fw16";
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "zen-twilight";
      TERMINAL = "foot";
      NIXOS_OZONE_WL = "1";
    };
  };

  programs.keychain = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    keys = ["id_ed25519"];
  };
}
