{
  host,
  inputs,
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../../modules/nixos/bootloader.nix
    ../../modules/nixos/greetd.nix
    ../../modules/nixos/hardware.nix
    ../../modules/nixos/xserver.nix
    ../../modules/nixos/networking.nix
    ../../modules/nixos/nh.nix
    ../../modules/nixos/pipewire.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/security.nix
    ../../modules/nixos/services.nix
    ../../modules/nixos/stylix.nix
    ../../modules/nixos/system.nix
    # ../../modules/nixos/thunar.nix
    ../../modules/nixos/user.nix
    # ../../modules/nixos/wayland.nix
  ];

  powerManagement.cpuFreqGovernor = "performance";

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports = [
        ../../modules/home/bat.nix
        ../../modules/home/browser.nix
        ../../modules/home/btop.nix
        ../../modules/home/discord.nix
        ../../modules/home/fastfetch.nix
        ../../modules/home/fish.nix
        ../../modules/home/fzf.nix
        ../../modules/home/git.nix
        # ../../modules/home/desktops/hyprland
        ../../modules/home/desktops/niri
        ../../modules/home/kitty.nix
        ../../modules/home/lazygit.nix
        ../../modules/home/programs
        ../../modules/home/scripts/scripts.nix
        ../../modules/home/vscodium
        ../../modules/home/xdg-mimes.nix
        ../../modules/home/yazi.nix
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
    };
  };
}
