{...}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -la";
    };
  };
}
