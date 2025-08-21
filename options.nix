{lib, ...}:
with lib; {
  options = {
    custom = {
      input = {
        mouse-sensivity = mkOption {
          type = types.float;
          default = 0.0;
          example = -0.6;
        };
      };
    };
  };
}
