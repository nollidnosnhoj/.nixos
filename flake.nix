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

    claude-code.url = "github:sadjow/claude-code-nix";

    hyprland.url = "github:hyprwm/Hyprland";

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    nur,
    nixos-hardware,
    nixos-wsl,
    ...
  } @ inputs: let
    nixpkgsWithOverlays = system: (import nixpkgs rec {
      inherit system;

      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          # FIXME:: add any insecure packages you absolutely need here
        ];
      };

      overlays = [
        nur.overlays.default

        (final: prev: {
          nur = import inputs.nur {
            nurpkgs = prev;
            pkgs = prev;
          };
        })
      ];
    });

    argDefaults = {
      inherit inputs self;
    };

    mkNixosConfiguration = {
      system ? "x86_64-linux",
      host,
      username,
      args ? {},
      modules,
    }: let
      specialArgs = argDefaults // {inherit host username;} // args;
    in
      nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        pkgs = nixpkgsWithOverlays system;
        modules =
          [
            home-manager.nixosModules.home-manager
          ]
          ++ modules;
      };
  in {
    nixosConfigurations = {
      framework16 = mkNixosConfiguration {
        host = "framework16";
        username = "kopa";
        modules = [
          stylix.nixosModules.stylix
          chaotic.nixosModules.default
          nixos-hardware.nixosModules.framework-16-7040-amd
          ./hosts/framework16
        ];
      };
      wsl = mkNixosConfiguration {
        host = "wsl";
        username = "kopa";
        modules = [
          nixos-wsl.nixosModules.wsl
          ./hosts/wsl
        ];
      };
    };
  };
}
