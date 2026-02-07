{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
    vim
  ];
  programs = {
    dconf.enable = true;
  };
}
