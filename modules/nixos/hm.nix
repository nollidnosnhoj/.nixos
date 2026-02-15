{
  host,
  isDesktop,
  isLaptop,
  isWSL,
  inputs,
  username,
  self,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        self
        isLaptop
        isDesktop
        isWSL
        ;
    };
    users.${username} = {
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "25.11";
      programs.home-manager.enable = true;
      _module.args.inputs = inputs;
    };
    backupFileExtension = "hmbackup";
  };
}
