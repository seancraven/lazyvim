return {
  { "mrjones2014/smart-splits.nvim" },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  { "numToStr/Comment.nvim" },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "default",
        ["<C-a>"] = { "select_and_accept" },
      },
    },
  },
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
        -- version = "*",
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
  {
    "folke/tokyonight.nvim",
    lazy = "false",
    priority = 1000,
    opts = {
      style = "night",
      transparent = "true",
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        cursorline = "transparent",
      },
      on_highlights = function(hl, colors)
        hl.CursorLine = {
          bg = "",
        }
        hl.CursorLineNr = {
          fg = colors.orange,
        }
      end,
      --- @param colors ColorScheme
      on_colors = function(colors)
        colors.comment = colors.magenta
      end,
    },
  },
}
