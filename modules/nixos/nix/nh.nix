{username, ...}: {
  environment.variables.NH_FLAKE = "/home/${username}/.nixos";

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 7d";
    };
  };
}
