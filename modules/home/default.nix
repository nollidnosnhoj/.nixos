{
  config,
  host,
  inputs,
  username,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs username host;
      nixosConfig = config;
    };
    users.${username} = {
      imports = [
        ./bat.nix
        ./browser.nix
        ./btop.nix
        ./discord.nix
        ./fastfetch.nix
        ./fish.nix
        ./fzf.nix
        ./git.nix
        ./desktop
        ./kitty.nix
        ./lazygit.nix
        ./editors/neovim
        ./programs
        ./scripts/scripts.nix
        ./editors/vscodium
        ./editors/zed
        ./xdg-mimes.nix
        ./yazi.nix
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;

      _module.args.inputs = inputs;
    };
  };
}
