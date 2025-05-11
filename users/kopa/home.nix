{ pkgs, ... }: {
  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/zsh
  ];

  programs.git = {
    userName = "Dillon Johnson";
    userEmail = "me@nollidnosnhoj.com";
  };
}