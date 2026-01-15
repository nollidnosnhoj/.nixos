{
  inputs,
  pkgs,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "input"
    ];
    packages = [
      inputs.home-manager.packages.${pkgs.system}.default
    ];
    shell = pkgs.fish;
  };

  nix.settings.allowed-users = ["${username}"];
  environment.localBinInPath = true;
}
