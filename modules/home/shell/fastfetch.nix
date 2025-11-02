{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [fastfetch];

  xdg.configFile."fastfetch/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nixos/dotfiles/fastfetch/.config/fastfetch/config.jsonc";
}
