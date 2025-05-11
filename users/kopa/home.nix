{ pkgs, ... }: {
  imports = [
    ../../home/core.nix

    ../../home/editors
    ../../home/programs
    ../../home/zsh
  ];

  programs.git = {
    userName = "Dillon Johnson";
    userEmail = "me@nollidnosnhoj.com";
  };
}