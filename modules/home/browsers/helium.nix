{pkgs, ...}: {
  home.packages = with pkgs; [
    nur.repos.forkprince.helium-nightly
  ];
}
