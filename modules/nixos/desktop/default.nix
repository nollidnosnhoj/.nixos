{pkgs, ...}: {
  imports = [
    ./nautilus.nix
    ./niri.nix
    ./noctalia.nix
    ./xserver.nix
  ];

  environment.systemPackages = with pkgs; [
    libnotify
  ];
}
