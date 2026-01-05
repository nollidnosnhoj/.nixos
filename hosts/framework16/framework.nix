{lib, ...}: {
  hardware = {
    fw-fanctrl = {
      enable = true;
      config = {
        defaultStrategy = "medium";
      };
    };
    keyboard.qmk.enable = true;
    inputmodule.enable = true;
    framework.enableKmod = false;
  };

  services = {
    fwupd.enable = lib.mkForce true;
    fprintd.enable = true;
    udev.extraRules = ''
      SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0012", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
      SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="32ac", ATTRS{idProduct}=="0014", ATTR{power/wakeup}="disabled", ATTR{driver/1-1.1.1.4/power/wakeup}="disabled"
    '';
  };
}
