local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier",
    extra_args = { "--single-quote=true", "--jsx-single-quote=true" },
    filetypes = { "typescript", "typescriptreact" },
  }
}
