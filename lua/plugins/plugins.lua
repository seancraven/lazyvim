return {
  { "mrjones2014/smart-splits.nvim" },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "tpope/vim-dadbod",
    opt = true,
  },
  { "onsails/lspkind.nvim" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
    },

    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local lspkind = require("lspkind")
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- opts.sources(vim.list_extend(opts.sources({ { name = "vim-dadbod-completion" } })))
      cmp.setup.filetype("sql", {
        sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "luasnip" } }),
      })

      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 50,
        }),
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-a>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  { "numToStr/Comment.nvim" },
  { "ThePrimeagen/harpoon" },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = false,
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = false, auto_trigger = true },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("neogen").setup({
        -- Uncomment next line if you want to follow only stable versions
        version = "*",
        languages = {
          python = {
            template = {
              annotation_convention = "reST",
            },
          },
        },
      })
    end,
  },
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = true }, -- disables git signs
      tmux = { enabled = false },    -- disables the tmux statusline
      kitty = { enabled = true, font = "+2" },
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true, -- disables setting the background color.
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
    }
  },
}
