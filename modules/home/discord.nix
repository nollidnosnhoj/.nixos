{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  # programs.nixcord = {
  #   enable = true;
  #   vesktop.enable = true;
  #   vesktop.package = pkgs.vesktop;
  #   config = {
  #     frameless = true;
  #     plugins = {
  #       webRichPresence.enable = true;
  #       webScreenShareFixes.enable = true;
  #       youtubeAdblock.enable = true;
  #       appleMusicRichPresence.enable = true;
  #     };
  #   };
  # };

  # services.arrpc.enable = true;
  # services.arrpc.package = pkgs.arrpc;
}
