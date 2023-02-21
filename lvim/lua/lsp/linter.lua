local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },
  -- {
  --   command = "shellcheck",
  --   extra_args = { "--severity", "warning" },
  -- },
}
