{pkgs,...}:
{
  services.gvfs.enable = true;
  environment.systemPackages = with pkgs; [
    nautilus
    sushi
    code-nautilus
    nautilus-open-any-terminal
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };
}
