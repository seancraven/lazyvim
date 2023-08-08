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

vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment line" })

-- Comments
vim.keymap.set(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment for selection" }
)
-- Search
--
vim.keymap.set("n", "<leader>fw", function()
  require("telescope.builtin").live_grep()
end, { desc = "Find words" })
vim.keymap.set("n", "<leader>fk", function()
  require("telescope.builtin").keymaps()
end, { desc = "Find Keymaps" })

vim.keymap.set("n", "<leader>cz", require("zen-mode").toggle, { desc = "Zen Mode" })
vim.keymap.set("n", "<leader>cw", require("wrapping").soft_wrap_mode, { desc = "Soft Wrap" })
