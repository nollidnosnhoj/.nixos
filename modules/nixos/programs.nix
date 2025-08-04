{
  inputs,
  pkgs,
  ...
}: {
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    unzip
    curl
    inputs.swww.packages.${system}.swww
    playerctl
    base16-schemes
    pavucontrol
    xwayland
    ffmpeg
    htop
    poweralertd
    libnotify
  ];
}
