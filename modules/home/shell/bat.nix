{pkgs, ...}: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batman
      batpipe
      batgrep # batgrep does not work right now
      batdiff
    ];
  };
}
