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
    };
  };
}
