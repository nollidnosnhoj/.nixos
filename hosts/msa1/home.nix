{...}: {
  imports = [
    ../../modules/home/bat.nix
    ../../modules/home/browser
    ../../modules/home/btop.nix
    ../../modules/home/discord.nix
    ../../modules/home/editors/neovim
    ../../modules/home/editors/rider
    ../../modules/home/editors/vscodium
    ../../modules/home/editors/zed
    ../../modules/home/fastfetch.nix
    ../../modules/home/zsh.nix
    ../../modules/home/fzf.nix
    ../../modules/home/git.nix
    ../../modules/home/desktop
    ../../modules/home/kitty.nix
    ../../modules/home/lazygit.nix
    ../../modules/home/programs
    ../../modules/home/scripts/scripts.nix
    ../../modules/home/stylix.nix
    ../../modules/home/xdg-mimes.nix
    ../../modules/home/yazi.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  services.blueman-applet.enable = true;
}
