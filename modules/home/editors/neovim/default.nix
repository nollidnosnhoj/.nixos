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

        lsp = {
          enable = true;
          lspconfig.enable = true;
        };

        options.splitright = true;
        options.splitbelow = true;
        options.shiftwidth = 2;
        options.cursorlineopt = "line";
        lineNumberMode = "relative";

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;

        binds = {whichKey.enable = true;};

        formatter.conform-nvim.enable = true;

        languages = {
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
          lua = {
            enable = true;
            format.enable = true;
            lsp.enable = true;
            lsp.lazydev.enable = true;
            treesitter.enable = true;
          };
        };

        lsp.formatOnSave = true;

        visuals.nvim-web-devicons.enable = true;

        utility.motion.precognition.enable = true;
        utility.oil-nvim.enable = true;
      };
    };
  };
}
