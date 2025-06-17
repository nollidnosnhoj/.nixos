{...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/home
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
