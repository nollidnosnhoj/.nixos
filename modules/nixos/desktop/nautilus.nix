{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nautilus
    sushi
    code-nautilus
    nautilus-open-any-terminal
    file-roller
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };
}
