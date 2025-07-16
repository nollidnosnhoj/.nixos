{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history.size = 5000;
    shellAliases = {
      ll = "ls -la";
    };
  };
}
