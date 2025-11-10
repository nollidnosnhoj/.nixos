{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nautilus
    sushi
    file-roller
  ];
}
