{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [starship];

  programs.bash.initExtra = ''
    eval "$(starship init bash)"
  '';

  programs.zsh.initExtra = ''
    eval "$(starship init zsh)"
  '';

  xdg.configFile."starship.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos/dotfiles/starship/.config/starship.toml";
}
