{...}: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    libinput.enable = true;
  };

  console = {
    useXkbConfig = true;
  };
}
