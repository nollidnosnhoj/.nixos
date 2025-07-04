{pkgs,...}:
{
  services.mako.enable = true;
  services.mako.package = pkgs.mako;
}
