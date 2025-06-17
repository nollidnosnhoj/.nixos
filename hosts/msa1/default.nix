{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  powerManagement.cpuFreqGovernor = "performance";

  input = {
    mouse-sensivity = -0.2;
  };
}
