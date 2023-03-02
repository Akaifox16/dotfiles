lvim.plugins = {
  { 'phaazon/hop.nvim',
    event = 'BufRead',
    branch = 'v2',
    config = function()
      require('hop').setup({
        keys = 'etovxqpdygfblzhckisuran'
      })
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection

      vim.keymap.set('n', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('n', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('n', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('n', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
    end
  },
  { "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()

      local mark = require('harpoon.mark')
      local ui = require('harpoon.ui')
      -- harpoon functionality
      vim.keymap.set('n', '<C-a>', mark.add_file)
      vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

      -- harpoon page navigation
      vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
      vim.keymap.set('n', '<C-j>', function() ui.nav_file(2) end)
      vim.keymap.set('n', '<C-k>', function() ui.nav_file(3) end)
      vim.keymap.set('n', '<C-l>', function() ui.nav_file(4) end)
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
  { "folke/trouble.nvim",
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
  { "folke/todo-comments.nvim",
    config = function()
      require('todo-comments').setup()

      lvim.builtin.which_key.mappings['z'] = {
        name = 'Todo',
        q = { "<cmd>TodoQuickFix<cr>", 'quickfix' },
        l = { "<cmd>TodoTrouble<cr>", 'list' }
      }

    end
  },
  { "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        filetype = { 'html', 'xml', 'tsx', 'jsx' }
      })
    end
  },
  { "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  { "romgrk/nvim-treesitter-context",
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
          },
          terraform = {
            'block',
            'object_elem',
            'attributes',
          }
        }
      }
    end
  },
}
