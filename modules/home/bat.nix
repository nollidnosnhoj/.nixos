{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "nord";
    };
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep
      batdiff
    ];
  };
}
