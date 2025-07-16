{...}: {
  imports = [
    ../../modules/home
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.blueman-applet.enable = true;
}
