{
  config,
  host,
  inputs,
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
      nixosConfig = config;
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
}
