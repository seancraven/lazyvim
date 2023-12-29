return {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  opt = true,
  requires = { "kristijanhusak/vim-dadbod-completion" },
  config = function()
    require("config.dadbod").setup()
  end,
}
