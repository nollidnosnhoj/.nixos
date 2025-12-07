{
  description = "nollidnosnhoj's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

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
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
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
    mkSystem = system: host: extraModules:
      nixpkgs.lib.nixosSystem {
        system = system;
        modules = defaultModules ++ extraModules;
        specialArgs = {
          username = "kopa";
          inherit self inputs host;
        };
      };
  in {
    nixosConfigurations = {
      framework16 = mkSystem "x86_64-linux" "framework16" [
        chaotic.nixosModules.default
        nixos-hardware.nixosModules.framework-16-7040-amd
        stylix.nixosModules.stylix
        ./hosts/framework16
      ];
      wsl = mkSystem "x86_64-linux" "wsl" [
        nixos-wsl.nixosModules.default
        stylix.nixosModules.stylix
        ./hosts/wsl
      ];
    };
  };
}
