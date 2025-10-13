{pkgs, ...}: {
  imports = [./dotnet.nix];
  home.packages = with pkgs; [
    jetbrains.rider
  ];
}
