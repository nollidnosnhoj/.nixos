{
  description = "nollidnosnhoj's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nur.url = "github:nix-community/NUR";

    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";
    nvf.url = "github:notashelf/nvf";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    self,
    home-manager,
    stylix,
    chaotic,
    ...
  } @ inputs: let
    defaultModules = [
      {
        _module.args = {
          inherit inputs;
        };
      }
      home-manager.nixosModules.home-manager
      stylix.nixosModules.stylix
      chaotic.nixosModules.default
      {
        nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
        nixpkgs = {
          config = {
            allowUnfree = true;
          };
        };

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
        };
      }
    ];

    mkSystem = host: username: extraModules:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = defaultModules ++ extraModules;
        specialArgs = {
          inherit self inputs host username;
        };
      };
  in {
    nixosModules.default = {...}: {
      imports = defaultModules ++ [./modules];
    };
    nixosConfigurations = {
      framework16 = mkSystem "framework16" "kopa" [./hosts/framework16];
    };
  };
}
