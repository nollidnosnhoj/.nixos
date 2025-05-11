{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    ripgrep
    fzf
    zoxide
    which
    tree
    file
    gnused
    gnutar
    gnupg
    mise
    xdg-utils
    mise
  ];

  programs = {
    btop.enable =  true;
    eza.enable = true;
    jq.enable = true;
    ssh.enable = true;
  };

  services = {
    udiskie.enable = true;
  };
}