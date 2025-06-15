{pkgs, ...}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    package = pkgs.starship;
  };
}
