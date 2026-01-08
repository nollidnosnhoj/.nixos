{username, ...}: {
  imports = [./nh.nix ./nix-ld.nix ./substituters.nix ./programs.nix];

  nix = {
    settings = {
      auto-optimise-store = true;
      download-buffer-size = 52428800;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = ["root" "@wheel" "${username}"];
    };
  };

  system.stateVersion = "25.11";
}
