{pkgs, ...}: {
  imports = [
    ../../modules/home
    ../../modules/home/browsers/brave.nix
    ../../modules/home/editors/rider
    ./xdg-mimes.nix
  ];
  services.blueman-applet.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    devenv # development envirronment

    postman
    libreoffice
  ];
}
