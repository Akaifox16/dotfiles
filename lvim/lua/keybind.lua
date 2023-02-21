vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("v", ";", ":", { noremap = true })

vim.cmd([[
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q! q!
]])

lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-n>"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode[", "] = ":nohl<cr>"

lvim.builtin.which_key.mappings["k"] = { "<cmd>Telescope buffers<CR>", "Search Buffers" }
lvim.builtin.which_key.mappings["g"] = { "<cmd>Telescope grep_string<CR>", "Grep in dir" }

lvim.builtin.which_key.mappings["L"]["t"] = { "<cmd>LvimToggleFormatOnSave<cr>", "ToggleFormatOnSave" }
