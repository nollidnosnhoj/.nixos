{inputs, ...}: {
  imports = [
    inputs.niri.homeModules.config
    inputs.niri.homeModules.stylix
    ./environments.nix
    ./keybinds.nix
    ./rules.nix
    ./settings.nix
    ../noctalia
  ];
}
