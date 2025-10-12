{config,host,self,...}: {
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
    file."${config.home.homeDirectory}/" = {
      source = "${self}/hosts/${host}/.config";
      recursive = true;
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
    keys = [ "id_ed25519" ];
  };
}
