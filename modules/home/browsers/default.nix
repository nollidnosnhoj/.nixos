{pkgs, ...}: {
  imports = [
    ./zen.nix
  ];

  home.packages = with pkgs; [
    mullvad-browser # private browser
  ];
}
