{pkgs, ...}: {
  imports = [
    ../../modules/home
    ../../modules/home/editors/rider
    ./xdg-mimes.nix
  ];
  services.blueman-applet.enable = true;
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    devenv # development envirronment
    claude-code

    postman
    libreoffice
  ];
}
