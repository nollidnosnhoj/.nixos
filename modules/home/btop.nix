{ pkgs, ... }:
{
  programs.btop = {
    enable = true;

    settings = {
      update_ms = 500;
      rounded_corners = false;
    };
  };

  home.packages = with pkgs; [
    nvtopPackages.amd
  ];
}
