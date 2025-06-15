{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    defaultEditor = true;

    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        globals.mapleader = " ";
        globals.maplocalleader = " ";

        options.splitright = true;
        options.splitbelow = true;
        options.shiftwidth = 2;
        options.cursorlineopt = "line";
        lineNumberMode = "relative";

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        languages = {
          enableLSP = true;
          enableTreesitter = true;

          nix = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            lsp.package = pkgs.nixd;
            lsp.server = "nixd";
            treesitter.enable = true;
          };
          ts.enable = true;
          rust.enable = true;
          go.enable = true;
        };

        utility.motion.precognition.enable = true;
      };
    };
  };
}
