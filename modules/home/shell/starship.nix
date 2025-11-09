{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [starship];

  programs.fish.shellInit = ''
    starship init fish | source
  '';

  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos/dotfiles/starship/.config/starship.toml";
}
