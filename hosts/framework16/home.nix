{config, ...}: {
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
    file.".config/noctalia" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos/hosts/framework16/.config/noctalia";
    };
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
