{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
  ];
  programs.dconf.enable = true;
  programs.ssh = {
    enableAskPassword = true;
  };
}
