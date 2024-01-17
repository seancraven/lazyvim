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

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- opts.sources(vim.list_extend(opts.sources({ { name = "vim-dadbod-completion" } })))
      cmp.setup.filetype("sql", {
        sources = cmp.config.sources({ { name = "nvim_lsp" } }, { { name = "luasnip" } }),
      })

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
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
  -- { "lervag/vimtex" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  { "numToStr/Comment.nvim" },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = {
  --
  --         keymap = {
  --           accept = "<M-l>",
  --           next = "<M-j>",
  --           previous = "<M-k>",
  --         },
  --       },
  --     })
  --   end,
  -- },
  { "ThePrimeagen/harpoon" },
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
}
