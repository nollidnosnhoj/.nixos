{
  bun2nix,
  pkgs,
  ...
}:
bun2nix.writeBunApplication {
  pname = "quick-search";
  version = "0.1.0";

  src = ./.;
  packageJson = ./package.json;

  startScript = ''
    bun run ./index.ts
  '';

  runtimeInputs = [pkgs.fuzzel];

  bunDeps = bun2nix.fetchBunDeps {
    bunNix = ./bun.nix;
  };
}
