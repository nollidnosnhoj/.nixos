{pkgs, ...}: {
  imports = [
    ./niri.nix
    ./xserver.nix
  ];

  environment.systemPackages = with pkgs; [
    libnotify
  ];
}
