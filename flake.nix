{
  description = "nollidnosnhoj's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

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
    chaotic,
    neovim-nightly-overlay,
    niri,
    nix-vscode-extensions,
    nixos-hardware,
    nixos-wsl,
    nix-darwin,
    nix-homebrew,
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
    ];
    defaultModules = [
      {
        nixpkgs = {
          config.allowUnfree = true;
          overlays = overlays;
        };
      }
    ];
    mkSystem = host: username: system: extraModules:
      nixpkgs.lib.nixosSystem {
        system = system;
        modules = defaultModules ++ extraModules;
        specialArgs = {
          username = "kopa";
          inherit self inputs host;
        };
      };
    mkDarwinSystem = host: username: system: extraModules:
      nix-darwin.lib.darwinSystem {
        modules = [
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.hostPlatform = system;
            nixpkgs.overlays = overlays;
          }
        ] ++ extraModules;
        specialArgs = {
          username = username;
          inherit self inputs host;
        };
      };
  in {
    nixosConfigurations = {
      framework16 = mkSystem "framework16" "kopa" "x86_64-linux"  [
        chaotic.nixosModules.default
        nixos-hardware.nixosModules.framework-16-7040-amd
        stylix.nixosModules.stylix
        ./hosts/framework16
      ];
      wsl = mkSystem "wsl" "kopa" "x86_64-linux" [
        nixos-wsl.nixosModules.default
        stylix.nixosModules.stylix
        ./hosts/wsl
      ];
      # macbook = mkDarwinSystem "macbook" "rjohnson" "aarch64-darwin" [
      #   nix-homebrew.darwinModules.nix-homebrew
      #   {
      #     nix-homebrew = {
      #       enable = true;
      #       # Apple Silicon Only, add conditional based on system
      #       enableRosetta = true;
      #       # User owning the Homebrew prefix
      #       user = "rjohnson";
      #       autoMigrate = true;
      #     };
      #   }
      #   stylix.nixosModules.stylix
      #   ./hosts/macbook
      # ];
    };
  };
}
