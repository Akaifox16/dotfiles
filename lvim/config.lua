require("lsp.linter")
require("lsp.formatter")
require("keybind")
require("plugin")

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.transparent_window = true
lvim.colorscheme = "tokyonight-storm"

vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.nu = true
vim.opt.relativenumber = true

lvim.builtin.gitsigns.active = true;
lvim.builtin.gitsigns.opts.current_line_blame = true;

lvim.builtin.alpha.active = false
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = false

-- nvim tree config
lvim.builtin.nvimtree.setup.view.side = "left"

-- telescope config
lvim.builtin.telescope.defaults.path_display = {
  shorten = {
    len = 5,
    exclude = { 1, -1 }
  },
  truncate = true
}

-- lua line styling
lvim.builtin.lualine.style = "default"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "prisma",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true
