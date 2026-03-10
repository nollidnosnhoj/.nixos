{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    sensibleOnTop = true;
    clock24 = true;
    disableConfirmationPrompt = true;
    historyLimit = 10000;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
    newSession = true;
    shell = "${pkgs.fish}/bin/fish";
  };
}
