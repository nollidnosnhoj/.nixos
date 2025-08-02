{...}: {
  imports = [
    ../../modules/home
    ../../modules/home/editors/rider
  ];
  services.blueman-applet.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
