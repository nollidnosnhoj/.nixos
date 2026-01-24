{
  inputs,
  pkgs,
  ...
}: {
  programs.opencode = {
    enable = true;
    package = inputs.opencode.packages.${pkgs.system}.default;
  };
}
