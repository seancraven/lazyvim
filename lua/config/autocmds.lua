-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additio,nal autocmds here
local function db_completion()
  require("cmp").setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
end
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "sql",
    "psql",
    "mysql",
  },
  callback = function()
    vim.schedule(db_completion)
  end,
})
