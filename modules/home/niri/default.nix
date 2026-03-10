{inputs, ...}: {
  imports = [
    inputs.niri.homeModules.config
    inputs.niri.homeModules.stylix
    ./binds.nix
    ./env.nix
    ./noctalia.nix
    ./rules.nix
    ./settings.nix
  ];
}