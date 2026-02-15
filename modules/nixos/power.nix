{
  lib,
  isLaptop,
  ...
}: {
  services = {
    logind.settings = lib.mkIf isLaptop {
      Login = {
        HandleLidSwitchExternalPower = "lock";
        HandleLidSwitch = "suspend";
        HandlePowerKey = "suspend";
      };
    };

    power-profiles-daemon.enable = true;

    upower = lib.mkIf isLaptop {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
  };

  systemd.sleep.extraConfig = lib.mkIf isLaptop ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';
}
