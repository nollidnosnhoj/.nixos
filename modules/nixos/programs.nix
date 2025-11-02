{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
  ];
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.ssh = {
    enableAskPassword = true;
  };
}
