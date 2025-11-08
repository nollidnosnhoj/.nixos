{
  host,
  inputs,
  pkgs,
  username,
  self,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs username host self;
    };
    users.${username} = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.05";
      programs.home-manager.enable = true;
      _module.args.inputs = inputs;
    };
    backupFileExtension = "backup";
  };

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
  };

  nix.settings.allowed-users = ["${username}"];
  environment.localBinInPath = true;
}
