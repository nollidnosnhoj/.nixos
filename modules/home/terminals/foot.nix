{pkgs, ...}: {
  programs.foot.enable = true;
  programs.foot.package = pkgs.foot;
  programs.foot.settings = {
    main = {
      pad = "12x12";
    };
  };
}
