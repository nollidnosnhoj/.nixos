{...}: {
  imports = [
    ../../modules/home
  ];
  services = {
    blueman-applet.enable = true;
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
