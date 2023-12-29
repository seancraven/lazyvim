-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additio,nal autocmds here
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.py", "*.rs", "*.sql", "*.md", "*.lua" },
  callback = require("zen-mode").open,
})
vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*.py", "*.rs", "*.sql", "*.md", "*.lua" },
  callback = require("zen-mode").close,
})
