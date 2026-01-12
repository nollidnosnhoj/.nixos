{...}: {
  programs.fastfetch = {
    enable = true;
    settings = {
      display = {
        separator = " ➜  ";
      };
      modules = [
        "break"
        "break"
        "break"
        {
          type = "os";
          key = "OS   ";
          keyColor = "31";
        }
        {
          type = "kernel";
          key = " ├  ";
          keyColor = "31";
        }
        {
          type = "shell";
          key = " └  ";
          keyColor = "31";
        }
        "break"
        {
          type = "wm";
          key = "WM   ";
          keyColor = "32";
        }
        {
          type = "terminal";
          key = " ├  ";
          keyColor = "32";
        }
        "break"
        {
          type = "host";
          format = "{5} {2}";
          key = "PC   ";
          keyColor = "33";
        }
        {
          type = "cpu";
          format = "{1} @ {7}";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "gpu";
          format = "{2}";
          key = " ├ 󰢮 ";
          keyColor = "33";
        }
        {
          type = "memory";
          key = " ├  ";
          keyColor = "33";
        }
        {
          type = "disk";
          key = " ├ 󰋊 ";
          keyColor = "33";
        }
        "break"
        "break"
      ];
    };
  };
}
