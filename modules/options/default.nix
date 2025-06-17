{lib, ...}:
with lib; {
  options.input.mouse-sensivity = mkOption {
    type = types.float;
    default = 0.0;
    example = -0.6;
  };
}
