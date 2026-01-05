{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
  ];
  programs = {
    dconf.enable = true;
    seahorse.enable = true;
    ssh = {
      enableAskPassword = true;
    };
  };
}
