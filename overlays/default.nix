{inputs}: [
  (final: prev: {
    nur = import inputs.nur {
      nurpkgs = prev;
      pkgs = prev;
    };
  })
  # inputs.niri.overlays.niri
  inputs.nix-vscode-extensions.overlays.default
  # inputs.neovim-nightly-overlay.overlays.default
  inputs.nix-cachyos-kernel.overlays.pinned
]
