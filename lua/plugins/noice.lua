return {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        lsp = { progress = { enabled = true } },
      })
    end,
  },
}
