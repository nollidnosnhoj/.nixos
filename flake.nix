{
  description = "nollidnosnhoj's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    neovim-nightly-overlay,
    nixos-hardware,
    nixos-wsl,
    nixpkgs,
    stylix,
    self,
    ...
  } @ inputs: let
    overlays = [
      # (final: prev: {})
      neovim-nightly-overlay.overlays.default
    ];
    defaultModules = [
      {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = overlays;
        };
      }
    ];
    mkNixosSystem = host: username: system: extraModules:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules =
          [
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ]
          ++ defaultModules
          ++ extraModules;
        specialArgs = {
          username = username;
          inherit self inputs host;
        };
      };
    # mkDarwinSystem = host: username: system: extraModules:
    #   nix-darwin.lib.darwinSystem {
    #     modules =
    #       [
    #         home-manager.darwinModules.home-manager
    #         {
    #           nixpkgs.hostPlatform = system;
    #           nix-homebrew = {
    #             enable = true;
    #             # Apple Silicon Only, add conditional based on system
    #             enableRosetta = true;
    #             # User owning the Homebrew prefix
    #             user = username;
    #             autoMigrate = true;
    #           };
    #         }
    #       ]
    #       ++ defaultModules
    #       ++ extraModules;
    #     specialArgs = {
    #       username = username;
    #       inherit self inputs host;
    #     };
    #   };
  in {
    nixosConfigurations = {
      wsl = mkNixosSystem "wsl" "kopa" "x86_64-linux" [
        nixos-wsl.nixosModules.default
        ./hosts/wsl
      ];
      msa1 = mkNixosSystem "msa1" "kopa" "x86_64-linux" [
        ./hosts/msa1
      ];
    };
  };
}
