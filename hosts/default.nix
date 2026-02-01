{inputs, ...}: let
  overlays = import ../overlays {inherit inputs;};
  defaultModules = [
    {
      nixpkgs = {
        config.allowUnfree = true;
        overlays = overlays;
      };
    }
  ];
  mk = host: username: system: extraModules:
    inputs.nixpkgs.lib.nixosSystem {
      system = system;
      modules =
        [
          inputs.home-manager.nixosModules.home-manager
        ]
        ++ defaultModules
        ++ extraModules;
      specialArgs = {
        username = username;
        inherit (inputs) self;
        inherit inputs host;
      };
    };
in {
  flake.nixosConfigurations = {
    framework16 = mk "framework16" "kopa" "x86_64-linux" [
      inputs.nixos-hardware.nixosModules.framework-16-7040-amd
      inputs.stylix.nixosModules.stylix
      ../hosts/framework16
    ];
    wsl = mk "wsl" "kopa" "x86_64-linux" [
      inputs.nixos-wsl.nixosModules.default
      inputs.stylix.nixosModules.stylix
      ../hosts/wsl
    ];
    msa1 = mk "msa1" "kopa" "x86_64-linux" [
      inputs.stylix.nixosModules.stylix
      ../hosts/msa1
    ];
    # macbook = mk "macbook" "rjohnson" "aarch64-darwin" [
    #   inputs.nix-homebrew.darwinModules.nix-homebrew
    #   inputs.stylix.nixosModules.stylix
    #   ../hosts/macbook
    # ];
  };
}
