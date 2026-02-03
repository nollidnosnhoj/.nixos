{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    let
      quick-search = pkgs.callPackage ./quick-search {
        bun2nix = inputs.bun2nix.packages.${pkgs.system}.bun2nix;
      };
    in
    {
      packages = {
        inherit quick-search;
        default = quick-search;
      };
    };
}
