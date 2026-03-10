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
    niri.url = "github:sodiboo/niri-flake";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };
    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    opencode.url = "github:anomalyco/opencode";
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    neovim-nightly-overlay,
    nix-vscode-extensions,
    nixos-wsl,
    nixpkgs,
    stylix,
    self,
    ...
  } @ inputs: let
    overlays = [
      neovim-nightly-overlay.overlays.default
      nix-vscode-extensions.overlays.default
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
