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
