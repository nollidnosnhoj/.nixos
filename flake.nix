{
  description = "nollidnosnhoj's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    bun2nix = {
      url = "github:nix-community/bun2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    linuxmobilepkgs.url = "github:linuxmobile/mynixpkgs";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
    nvf.url = "github:notashelf/nvf";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    opencode.url = "github:anomalyco/opencode";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixcord.url = "github:kaylorben/nixcord";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    home-manager,
    neovim-nightly-overlay,
    niri,
    nix-vscode-extensions,
    nixos-hardware,
    nixos-wsl,
    nix-cachyos-kernel,
    # nix-darwin,
    # nix-homebrew,
    nixpkgs,
    nur,
    self,
    stylix,
    ...
  } @ inputs: let
    overlays = [
      (final: prev: {
        nur = import nur {
          nurpkgs = prev;
          pkgs = prev;
        };
      })
      niri.overlays.niri
      nix-vscode-extensions.overlays.default
      neovim-nightly-overlay.overlays.default
      nix-cachyos-kernel.overlays.pinned
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
        system = system;
        modules =
          [
            home-manager.nixosModules.home-manager
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
      framework16 = mkNixosSystem "framework16" "kopa" "x86_64-linux" [
        nixos-hardware.nixosModules.framework-16-7040-amd
        stylix.nixosModules.stylix
        ./hosts/framework16
      ];
      wsl = mkNixosSystem "wsl" "kopa" "x86_64-linux" [
        nixos-wsl.nixosModules.default
        stylix.nixosModules.stylix
        ./hosts/wsl
      ];
      msa1 = mkNixosSystem "msa1" "kopa" "x86_64-linux" [
        stylix.nixosModules.stylix
        ./hosts/msa1
      ];
      # macbook = mkDarwinSystem "macbook" "rjohnson" "aarch64-darwin" [
      #   nix-homebrew.darwinModules.nix-homebrew
      #   stylix.nixosModules.stylix
      #   ./hosts/macbook
      # ];
    };
  };
}
