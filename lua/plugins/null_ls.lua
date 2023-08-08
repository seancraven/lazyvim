local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.ruff,
  },
}
return {
  "jose-elias-alvarez/null-ls.nvim",
  ft = { "python" },
  opts = opts,
}
