{
  inputs,
  username,
  ...
}: {
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  services = {
    displayManager.autoLogin.enable = false;

    displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      configHome = "/home/${username}";
      logs = {
        save = true;
        path = "/tmp/dms-greeter.log";
      };
    };

    greetd.settings = {
      initial_session = {
        user = "${username}";
        command = "niri-session";
      };
    };
  };
}
