return {
  { "mrjones2014/smart-splits.nvim" },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
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
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = true }, -- disables git signs
      tmux = { enabled = false }, -- disables the tmux statusline
    },
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
  {
    "mrcjkb/rustaceanvim",
    version = "^3",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
      {
        "lvimuser/lsp-inlayhints.nvim",
        opts = {},
      },
    },
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        inlay_hints = {
          highlight = "NonText",
        },
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            require("lsp-inlayhints").on_attach(client, bufnr)
          end,
        },
      }
    end,
  },
}
