-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to left split" })
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to left split" })
vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Move to left split" })
vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Move to left split" })
vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Move to left split" })
vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Move to left split" })
-- Supa Paste
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Super Yank" })
vim.keymap.set("n", "<leader>d", '"+d', { desc = "Super delete" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Super paste" })

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Super yank" })
vim.keymap.set("v", "<leader>d", '"+d', { desc = "Super delete" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Super paste" })

vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line" })

-- copilot
vim.keymap.set("i", "<C-]>", require("copilot.suggestion").accept_line, { desc = "Accept copilot suggestion" })
vim.keymap.set("i", "<C-}>", require("copilot.suggestion").next, { desc = "Next copilot suggestion" })
vim.keymap.set("i", "<C-{>", require("copilot.suggestion").prev, { desc = "Previous copilot suggestion" })
