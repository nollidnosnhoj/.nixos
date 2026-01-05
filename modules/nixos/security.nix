{
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
    sudo.wheelNeedsPassword = false;
  };
}
