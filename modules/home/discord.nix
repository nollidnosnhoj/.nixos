{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixcord.homeModules.nixcord];

  programs.nixcord = {
    enable = true;
    config = {
      frameless = true;
      plugins = {
        webRichPresence.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
        appleMusicRichPresence.enable = true;
      };
    };
  };

  services.arrpc.enable = true;
  services.arrpc.package = pkgs.arrpc;
}
