-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-storm"

vim.opt.gdefault = true
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })


-- vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

vim.cmd([[
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q! q!
]])

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode[", "] = ":nohl<cr>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

lvim.builtin.gitsigns.active = true;
lvim.builtin.gitsigns.opts.current_line_blame = true;

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["k"] = { "<cmd>Telescope buffers<CR>", "Search Buffers" }
lvim.builtin.which_key.mappings["g"] = { "<cmd>Telescope grep_string<CR>", "Grep in dir" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
-- q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }


lvim.builtin.which_key.mappings["L"]["t"] = { "<cmd>LvimToggleFormatOnSave<cr>", "ToggleFormatOnSave" }


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
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

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheReset` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts) -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier",
    extra_args = { "--single-quote=true", "--jsx-single-quote=true" },
    filetypes = { "typescript", "typescriptreact" },
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" } },
  -- {
  --   command = "shellcheck",
  --   extra_args = { "--severity", "warning" },
  -- },
}

lvim.plugins = {
  -- { "tpope/vim-eunuch" },
  { "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()

      -- harpoon functionality
      vim.api.nvim_set_keymap("n", "<C-a>", '<cmd>lua require("harpoon.mark").add_file()<CR>', { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-e>", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true })

      -- harpoon page navigation
      vim.api.nvim_set_keymap("n", "<C-h>", '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-j>", '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-k>", '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-l>", '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { noremap = true })
    end
  },
  { "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup()

      lvim.builtin.which_key.mappings['r'] = {
        name = 'refactor',
        e = { "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", "extract function" },
        f = { "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", "extract function to file" },
        v = { "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "extract variable" },
        i = { "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "inline variable" },
      }

    end
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    config = function()
      lvim.builtin.which_key.mappings["t"] = {
        name = "Diagnostics",
        t = { "<cmd>TroubleToggle<cr>", "trouble" },
        w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
        d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
        l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
        r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
      }
    end
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  -- {
  --   "p00f/nvim-ts-rainbow",
  -- },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,
        throttle = true,
        max_lines = 0,
        pattern = {
          default = {
            'class',
            'function',
            'method'
          }
        }
      }
    end
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
}


-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.ledger",
--   command = "LedgerAlignBuffer",
-- })
