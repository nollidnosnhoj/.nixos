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
  mk = {
    host,
    username,
    system,
    extraModules,
    isLaptop ? false,
    isDesktop ? false,
    isWSL ? false,
  }:
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
        inherit isLaptop isDesktop isWSL;
      };
    };
in {
  flake.nixosConfigurations = {
    framework16 = mk {
      host = "framework16";
      username = "kopa";
      system = "x86_64-linux";
      isLaptop = true;
      isDesktop = true;
      extraModules = [
        inputs.nixos-hardware.nixosModules.framework-16-7040-amd
        inputs.stylix.nixosModules.stylix
        ../hosts/framework16
      ];
    };
    wsl = mk {
      host = "wsl";
      username = "kopa";
      system = "x86_64-linux";
      isWSL = true;
      extraModules = [
        inputs.nixos-wsl.nixosModules.default
        inputs.stylix.nixosModules.stylix
        ../hosts/wsl
      ];
    };
    msa1 = mk {
      host = "msa1";
      username = "kopa";
      system = "x86_64-linux";
      isDesktop = true;
      extraModules = [
        inputs.stylix.nixosModules.stylix
        ../hosts/msa1
      ];
    };
    # macbook = mk "macbook" "rjohnson" "aarch64-darwin" [
    #   inputs.nix-homebrew.darwinModules.nix-homebrew
    #   inputs.stylix.nixosModules.stylix
    #   ../hosts/macbook
    # ];
  };
}
