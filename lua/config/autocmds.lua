-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additio,nal autocmds here
local programming_files = { "*.py", "*.sql", "*.md", "*.lua", "*.rs", "*.toml" }
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.md",
  callback = function()
    vim.cmd("set wrap")
    vim.cmd("set conceallevel=2")
  end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = programming_files,
  callback = require("zen-mode").open,
})
