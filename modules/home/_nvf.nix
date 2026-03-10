{inputs, ...}: {
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

        withNodeJs = false;
        withPython3 = false;
        withRuby = false;

        enableLuaLoader = true;
        hideSearchHighlight = true;
        searchCase = "smart";

        options = {
          splitright = true;
          splitbelow = true;
          shiftwidth = 2;
          cursorlineopt = "line";
        };

        globals.mapleader = " ";
        globals.maplocalleader = " ";

        autopairs.nvim-autopairs.enable = true;
        autocomplete.nvim-cmp.enable = true;
        telescope.enable = true;
        statusline.lualine.enable = true;
        comments.comment-nvim.enable = true;
        git.gitsigns.enable = true;

        lsp = {
          enable = true;
          formatOnSave = true;
          lspconfig.enable = true;
        };

        languages = {
          enableFormat = true;
          enableTreesitter = true;
          enableExtraDiagnostics = true;

          bash.enable = true;
          css.enable = true;
          go.enable = true;
          html.enable = true;
          lua.enable = true;
          markdown.enable = true;
          nix = {
            enable = true;
            format.type = ["alejandra"];
            lsp.servers = ["nixd"];
          };
          tailwind.enable = true;
          ts = {
            enable = true;
            extensions.ts-error-translator.enable = true;
          };
          yaml.enable = true;
        };

        notify.nvim-notify = {
          enable = true;
          setupOpts = {
            render = "minimal";
            stages = "static";
          };
        };

        spellcheck.enable = true;

        terminal.toggleterm = {
          enable = true;
          setupOpts = {
            direction = "float";
          };
        };

        utility = {
          motion.precognition.enable = true;
          preview.markdownPreview.enable = true;
          oil-nvim = {
            enable = true;
          };
        };

        mini = {
          icons.enable = true;
          tabline = {
            enable = true;
            setupOpts = {
              show_icons = true;
            };
          };
        };

        visuals = {
          indent-blankline.enable = true;
        };

        ui = {
          noice.enable = true;
          borders = {
            enable = true;
            globalStyle = "rounded";
            plugins.nvim-cmp.enable = false;
          };
          smartcolumn = {
            enable = true;
            setupOpts.custom_colorcolumn = {
              nix = "110";
            };
          };
        };

        lineNumberMode = "relative";

        binds = {whichKey.enable = true;};

        formatter.conform-nvim.enable = true;
      };
    };
  };
}
