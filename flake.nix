{
  description = "nollidnosnhoj's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    claude-code.url = "github:sadjow/claude-code-nix";

    hyprland.url = "github:hyprwm/Hyprland";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nur.url = "github:nix-community/NUR";

    quickshell = {
      # add ?ref=<tag> to track a tag
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";

      # THIS IS IMPORTANT
      # Mismatched system dependencies will lead to crashes and other issues.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord.url = "github:kaylorben/nixcord";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    nixpkgs,
    self,
    home-manager,
    stylix,
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
