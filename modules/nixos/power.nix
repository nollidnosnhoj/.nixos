{
  services = {
    logind.settings.Login = {
      HandleLidSwitchExternalPower = "lock";
      HandleLidSwitch = "suspend";
      HandlePowerKey = "suspend";
    };

    power-profiles-daemon.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };
  };

  # Configure systemd sleep settings for security (based on Arch documentation)
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';
}
