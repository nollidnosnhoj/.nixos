{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hypridle.nix
    ./niri
  ];

  home.packages = with pkgs; [
    # Quickshell Noctalia
    inputs.noctalia.packages.${system}.default
    inputs.quickshell.packages.${system}.default
  ];
}
