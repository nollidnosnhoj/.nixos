{...}: {
  imports = [
    ../../modules/home
  ];
  services.blueman-applet.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
