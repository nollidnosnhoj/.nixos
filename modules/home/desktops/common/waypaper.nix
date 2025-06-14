{pkgs, ...}: {
  home.packages = with pkgs; [waypaper];

  xdg.configFile."waypaper/config.ini".text = ''
    [Settings]
    language = en
    folder = ~/.nixos/.assets/wallpapers
    monitors = All
    wallpaper = ~/.nixos/.assets/wallpapers/nordtheme.png
    backend = swww
    fill = fill
    sort = name
    color = #ffffff
    subfolders = False
    show_hidden = False
    show_gifs_only = False
    post_command = post-wallpaper $wallpaper
    number_of_columns = 3
    swww_transition_type = any
    swww_transition_step = 90
    swww_transition_angle = 0
    swww_transition_duration = 2
    swww_transition_fps = 60
    use_xdg_state = False
  '';
}
